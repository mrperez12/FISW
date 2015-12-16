package activities


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])


@Transactional
class CongressController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Congress.list(params), model:[congressInstanceCount: Congress.count()]
    }

    def show(Congress congressInstance) {
        respond congressInstance
    }
    def list() {
        params.max = 10
        def congreso =Congress.findAllByUser(springSecurityService.currentUser)
        [congressInstanceList: congreso, congressInstanceTotal: Congress.count()]
    }
    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
            def congressInstance = new Congress()
            congressInstance.properties = params
            congressInstance.filename = file.originalFilename
            congressInstance.fullPath = grailsApplication.config.uploadFolder + congressInstance.filename
            file.transferTo(new File(congressInstance.fullPath))
            congressInstance.user= springSecurityService.getCurrentUser()
            congressInstance.save()
        }
        redirect (action:'list')
    }
    def download(long id) {
        Congress congressInstance = Congress.get(id)
        if ( congressInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${congressInstance.filename}\"")
            def file = new File(congressInstance.fullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }
    def create() {
        respond new Congress(params)
    }

    @Transactional
    def save(Congress congressInstance) {
        if (congressInstance == null) {
            notFound()
            return
        }

        if (congressInstance.hasErrors()) {
            respond congressInstance.errors, view:'create'
            return
        }

        congressInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'congress.label', default: 'Congress'), congressInstance.id])
                redirect congressInstance
            }
            '*' { respond congressInstance, [status: CREATED] }
        }
    }

    def edit(Congress congressInstance) {
        respond congressInstance
    }

    @Transactional
    def update(Congress congressInstance) {
        if (congressInstance == null) {
            notFound()
            return
        }

        if (congressInstance.hasErrors()) {
            respond congressInstance.errors, view:'edit'
            return
        }

        congressInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Congress.label', default: 'Congress'), congressInstance.id])
                redirect congressInstance
            }
            '*'{ respond congressInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Congress congressInstance) {

        if (congressInstance == null) {
            notFound()
            return
        }

        congressInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Congress.label', default: 'Congress'), congressInstance.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'congress.label', default: 'Congress'), params.id])
                redirect action: "list", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
