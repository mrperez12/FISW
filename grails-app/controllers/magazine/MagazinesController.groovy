package magazine



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_ADMIN','ROLE_USER'])
@Transactional
class MagazinesController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Magazines.list(params), model:[magazinesInstanceCount: Magazines.count()]
    }

    def show(Magazines magazinesInstance) {
        respond magazinesInstance
    }

    def create() {
        respond new Magazines(params)
    }
    def list() {
        params.max = 10
        def revista =Magazines.findAllByUser(springSecurityService.currentUser)
        [magazinesInstanceList: revista, magazinesInstanceTotal: Magazines.count()]
    }
    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
            def magazinesInstance = new Magazines()
            magazinesInstance.properties = params
            magazinesInstance.filename = file.originalFilename
            magazinesInstance.fullPath = grailsApplication.config.uploadFolder + magazinesInstance.filename
            file.transferTo(new File(magazinesInstance.fullPath))
            magazinesInstance.user= springSecurityService.getCurrentUser()
            magazinesInstance.save()
        }
        redirect (action:'list')
    }
    def download(long id) {
        Magazines magazinesInstance = Magazines.get(id)
        if ( magazinesInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${magazinesInstance.filename}\"")
            def file = new File(magazinesInstance.fullPath)
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
    @Transactional
    def save(Magazines magazinesInstance) {
        if (magazinesInstance == null) {
            notFound()
            return
        }

        if (magazinesInstance.hasErrors()) {
            respond magazinesInstance.errors, view:'create'
            return
        }

        magazinesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'magazines.label', default: 'Magazines'), magazinesInstance.id])
                redirect magazinesInstance
            }
            '*' { respond magazinesInstance, [status: CREATED] }
        }
    }

    def edit(Magazines magazinesInstance) {
        respond magazinesInstance
    }

    @Transactional
    def update(Magazines magazinesInstance) {
        if (magazinesInstance == null) {
            notFound()
            return
        }

        if (magazinesInstance.hasErrors()) {
            respond magazinesInstance.errors, view:'edit'
            return
        }

        magazinesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Magazines.label', default: 'Magazines'), magazinesInstance.id])
                redirect magazinesInstance
            }
            '*'{ respond magazinesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Magazines magazinesInstance) {

        if (magazinesInstance == null) {
            notFound()
            return
        }

        magazinesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Magazines.label', default: 'Magazines'), magazinesInstance.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'magazines.label', default: 'Magazines'), params.id])
                redirect action: "list", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
