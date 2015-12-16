package proyect



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
@Transactional
class ProyectsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proyects.list(params), model:[proyectsInstanceCount: Proyects.count()]
    }

    def show(Proyects proyectsInstance) {
        respond proyectsInstance
    }

    def create() {
        respond new Proyects(params)
    }
    @Transactional
    def save(Proyects proyectsInstance) {
        if (proyectsInstance == null) {
            notFound()
            return
        }

        if (proyectsInstance.hasErrors()) {
            respond proyectsInstance.errors, view:'create'
            return
        }

        proyectsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proyects.label', default: 'Proyects'), proyectsInstance.id])
                redirect proyectsInstance
            }
            '*' { respond proyectsInstance, [status: CREATED] }
        }
    }

    def edit(Proyects proyectsInstance) {
        respond proyectsInstance
    }

    @Transactional
    def update(Proyects proyectsInstance) {
        if (proyectsInstance == null) {
            notFound()
            return
        }

        if (proyectsInstance.hasErrors()) {
            respond proyectsInstance.errors, view:'edit'
            return
        }

        proyectsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proyects.label', default: 'Proyects'), proyectsInstance.id])
                redirect proyectsInstance
            }
            '*'{ respond proyectsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Proyects proyectsInstance) {

        if (proyectsInstance == null) {
            notFound()
            return
        }

        proyectsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proyects.label', default: 'Proyects'), proyectsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyects.label', default: 'Proyects'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
