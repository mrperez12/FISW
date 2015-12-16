package tesisPre



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_ADMIN','ROLE_USER'])
@Transactional
class TesisPregradeController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TesisPregrade.list(params), model:[tesisPregradeInstanceCount: TesisPregrade.count()]
    }

    def show(TesisPregrade tesisPregradeInstance) {
        respond tesisPregradeInstance
    }
    def list() {
        params.max = 10
        def tesis =TesisPregrade.findAllByUser(springSecurityService.currentUser)
        [tesisPregradeInstanceList: tesis, tesisPregradeInstanceTotal: TesisPregrade.count()]
    }
    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        }
        if(TesisPregrade.count() >= 1){
            flash.message = "You already have a tesis"
        }
        else {
            def tesisPregradeInstance = new TesisPregrade()
            tesisPregradeInstance.properties = params
            tesisPregradeInstance.filename = file.originalFilename
            tesisPregradeInstance.fullPath = grailsApplication.config.uploadFolder + tesisPregradeInstance.filename
            file.transferTo(new File(tesisPregradeInstance.fullPath))
            tesisPregradeInstance.user= springSecurityService.getCurrentUser()
            tesisPregradeInstance.save()
        }
        redirect (action:'list')
    }
    def download(long id) {
        TesisPregrade tesisPregradeInstance = TesisPregrade.get(id)
        if ( tesisPregradeInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${tesisPregradeInstance.filename}\"")
            def file = new File(tesisPregradeInstance.fullPath)
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
        respond new TesisPregrade(params)
    }

    @Transactional
    def save(TesisPregrade tesisPregradeInstance) {
        if (tesisPregradeInstance == null) {
            notFound()
            return
        }

        if (tesisPregradeInstance.hasErrors()) {
            respond tesisPregradeInstance.errors, view:'create'
            return
        }

        tesisPregradeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tesisPregrade.label', default: 'TesisPregrade'), tesisPregradeInstance.id])
                redirect tesisPregradeInstance
            }
            '*' { respond tesisPregradeInstance, [status: CREATED] }
        }
    }

    def edit(TesisPregrade tesisPregradeInstance) {
        respond tesisPregradeInstance
    }

    @Transactional
    def update(TesisPregrade tesisPregradeInstance) {
        if (tesisPregradeInstance == null) {
            notFound()
            return
        }

        if (tesisPregradeInstance.hasErrors()) {
            respond tesisPregradeInstance.errors, view:'edit'
            return
        }

        tesisPregradeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TesisPregrade.label', default: 'TesisPregrade'), tesisPregradeInstance.id])
                redirect tesisPregradeInstance
            }
            '*'{ respond tesisPregradeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TesisPregrade tesisPregradeInstance) {

        if (tesisPregradeInstance == null) {
            notFound()
            return
        }

        tesisPregradeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TesisPregrade.label', default: 'TesisPregrade'), tesisPregradeInstance.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tesisPregrade.label', default: 'TesisPregrade'), params.id])
                redirect action: "list", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
