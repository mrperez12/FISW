package book


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])

@Transactional
class BooksController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Books.list(params), model:[booksInstanceCount: Books.count()]
    }
    def show(Books booksInstance) {
        respond booksInstance
    }
    def list() {
        params.max = 10
        def libro =Books.findAllByUser(springSecurityService.currentUser)
        [booksInstanceList: libro, booksInstanceTotal: Books.count()]
    }
    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
            def booksInstance = new Books()
            booksInstance.properties = params
            booksInstance.filename = file.originalFilename
            booksInstance.fullPath = grailsApplication.config.uploadFolder + booksInstance.filename
            file.transferTo(new File(booksInstance.fullPath))
            booksInstance.user= springSecurityService.getCurrentUser()
            booksInstance.save()
        }
        redirect (action:'list')
    }
    def download(long id) {
        Books booksInstance = Books.get(id)
        if ( booksInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${booksInstance.filename}\"")
            def file = new File(booksInstance.fullPath)
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
        respond new Books(params)
    }
    @Transactional
    def save(Books booksInstance) {
        if (booksInstance == null) {
            notFound()
            return
        }

        if (booksInstance.hasErrors()) {
            respond booksInstance.errors, view:'create'
            return
        }

        booksInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'books.label', default: 'Books'), booksInstance.id])
                redirect booksInstance
            }
            '*' { respond booksInstance, [status: CREATED] }
        }
    }

    def edit(Books booksInstance) {
        respond booksInstance
    }

    @Transactional
    def update(Books booksInstance) {
        if (booksInstance == null) {
            notFound()
            return
        }

        if (booksInstance.hasErrors()) {
            respond booksInstance.errors, view:'edit'
            return
        }

        booksInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Books.label', default: 'Books'), booksInstance.id])
                redirect booksInstance
            }
            '*'{ respond booksInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Books booksInstance) {

        if (booksInstance == null) {
            notFound()
            return
        }

        booksInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Books.label', default: 'Books'), booksInstance.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), params.id])
                redirect action: "list", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
