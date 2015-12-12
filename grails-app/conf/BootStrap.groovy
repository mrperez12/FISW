import security.*
import user.UserProfile

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
        def directorRole = new Role(authority: 'ROLE_DIRECTOR').save(flush: true)


        def testUser = new User(username: 'mario.perez.12@sansano.usm.cl', password: '1234' , userProfile: new UserProfile(name: null, lastName: null, studiesPos: null,studiesPre: null, labCharge: 'Estudiante de Pregrado', investigation: 'Microbiologia') )
        testUser.save(flush: true)

        UserRole.create testUser, adminRole, true


        assert User.count() == 1
        assert Role.count() == 3
        assert UserRole.count() == 1

    }
    def destroy = {
    }
}