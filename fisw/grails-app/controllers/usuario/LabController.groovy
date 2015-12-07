package usuario



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LabController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lab.list(params), model:[labInstanceCount: Lab.count()]
    }

    def show(Lab labInstance) {
        respond labInstance
    }

    def create() {
        respond new Lab(params)
    }

    @Transactional
    def save(Lab labInstance) {
        if (labInstance == null) {
            notFound()
            return
        }

        if (labInstance.hasErrors()) {
            respond labInstance.errors, view:'create'
            return
        }

        labInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lab.label', default: 'Lab'), labInstance.id])
                redirect labInstance
            }
            '*' { respond labInstance, [status: CREATED] }
        }
    }

    def edit(Lab labInstance) {
        respond labInstance
    }

    @Transactional
    def update(Lab labInstance) {
        if (labInstance == null) {
            notFound()
            return
        }

        if (labInstance.hasErrors()) {
            respond labInstance.errors, view:'edit'
            return
        }

        labInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Lab.label', default: 'Lab'), labInstance.id])
                redirect labInstance
            }
            '*'{ respond labInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Lab labInstance) {

        if (labInstance == null) {
            notFound()
            return
        }

        labInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Lab.label', default: 'Lab'), labInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lab.label', default: 'Lab'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
