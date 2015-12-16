package user



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])

@Transactional(readOnly = true)
class UserProfileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserProfile.list(params), model:[userProfileInstanceCount: UserProfile.count()]
    }

    def show() {
        respond UserProfile.findByUser(springSecurityService.currentUser)//busco dentro de usuarios al user actual (logueado)

    }

    def create() {
        respond new UserProfile(params)
    }

    @Transactional
    def save(UserProfile userProfileInstance) {
        if (userProfileInstance == null) {
            notFound()
            return
        }

        if (userProfileInstance.hasErrors()) {
            respond userProfileInstance.errors, view:'create'
            return
        }

        userProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
                redirect userProfileInstance
            }
            '*' { respond userProfileInstance, [status: CREATED] }
        }
    }

    def edit() {
        respond UserProfile.findByUser(springSecurityService.currentUser)
    }

    @Transactional
    def update() {
        def userProfile = new UserProfile(params)//creo un nuevo usuario a partir de los parametros recibidos
        def log_usr = UserProfile.findByUser(springSecurityService.currentUser)
        if (userProfile == null) { //verifico que no sea nulo//
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (userProfile.hasErrors()) {//hago la validación de si es o no correcto el usuario
            transactionStatus.setRollbackOnly()
            respond userProfile.errors, view:'edit'
            return
        }
        log_usr.properties = params
        log_usr.save(flush:true) //guardo

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'userProfile.label', default: 'Usuario'), log_usr.id])
                redirect action:"show" //redirecciono a show
                }
            '*'{ respond userProfile, [status: OK] }
        }
    }


    @Transactional
    def delete(UserProfile userProfileInstance) {

        if (userProfileInstance == null) {
            notFound()
            return
        }

        userProfileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserProfile.label', default: 'UserProfile'), userProfileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
