package tesisPos

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_ADMIN','ROLE_USER'])
@Transactional
class TesisPostgradeController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TesisPostgrade.list(params), model:[tesisPostgradeInstanceCount: TesisPostgrade.count()]
    }

    def show(TesisPostgrade tesisPostgradeInstance) {
        respond tesisPostgradeInstance
    }
    def list() {
        params.max = 10
        //def tesisPos =TesisPostgrade.findAllByUser(springSecurityService.currentUser)
        def tesisPos = TesisPostgrade.createCriteria().list (params) {
            if ( params.query ) {
                ilike("nameTesisPos", "%${params.query}%")
            }
        }
        [tesisPostgradeInstanceList: tesisPos, tesisPostgradeInstanceTotal: TesisPostgrade.count()]
    }
    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        }
        if(TesisPostgrade.count() >= 1){
            flash.message = "You already have a tesis"
        }
        else {
            def tesisPostgradeInstance = new TesisPostgrade()
            tesisPostgradeInstance.properties = params
            tesisPostgradeInstance.filename = file.originalFilename
            tesisPostgradeInstance.fullPath = grailsApplication.config.uploadFolder + tesisPostgradeInstance.filename
            file.transferTo(new File(tesisPostgradeInstance.fullPath))
            tesisPostgradeInstance.user= springSecurityService.getCurrentUser()
            tesisPostgradeInstance.save()
        }
        redirect (action:'list')
    }
    def download(long id) {
        TesisPostgrade tesisPostgradeInstance = TesisPostgrade.get(id)
        if ( tesisPostgradeInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${tesisPostgradeInstance.filename}\"")
            def file = new File(tesisPostgradeInstance.fullPath)
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
        respond new TesisPostgrade(params)
    }

    @Transactional
    def save(TesisPostgrade tesisPostgradeInstance) {
        if (tesisPostgradeInstance == null) {
            notFound()
            return
        }

        if (tesisPostgradeInstance.hasErrors()) {
            respond tesisPostgradeInstance.errors, view:'create'
            return
        }

        tesisPostgradeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tesisPostgrade.label', default: 'TesisPostgrade'), tesisPostgradeInstance.id])
                redirect tesisPostgradeInstance
            }
            '*' { respond tesisPostgradeInstance, [status: CREATED] }
        }
    }

    def edit(TesisPostgrade tesisPostgradeInstance) {
        respond tesisPostgradeInstance
    }

    @Transactional
    def update(TesisPostgrade tesisPostgradeInstance) {
        if (tesisPostgradeInstance == null) {
            notFound()
            return
        }

        if (tesisPostgradeInstance.hasErrors()) {
            respond tesisPostgradeInstance.errors, view:'edit'
            return
        }

        tesisPostgradeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TesisPostgrade.label', default: 'TesisPostgrade'), tesisPostgradeInstance.id])
                redirect tesisPostgradeInstance
            }
            '*'{ respond tesisPostgradeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TesisPostgrade tesisPostgradeInstance) {

        if (tesisPostgradeInstance == null) {
            notFound()
            return
        }

        tesisPostgradeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TesisPostgrade.label', default: 'TesisPostgrade'), tesisPostgradeInstance.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tesisPostgrade.label', default: 'TesisPostgrade'), params.id])
                redirect action: "list", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
