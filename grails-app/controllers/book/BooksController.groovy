package book



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BooksController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Books.list(params), model:[booksInstanceCount: Books.count()]
    }

    def show(Books booksInstance) {
        respond booksInstance
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
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
