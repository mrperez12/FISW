package security
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class UserController extends grails.plugin.springsecurity.ui.UserController {
}
