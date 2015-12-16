import security.*
import user.UserProfile

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)


        def testUser = new User(username: 'bross_and_bross02@hotmail.com', password: '1234' , userProfile: new UserProfile(name: 'Mario', lastName:'Perez', studiesPos: null,universityPos: null, countryPos: null, studiesPre: 'Ing.Informatica', university: 'Santa Maria', country: 'Chile', labCharge: 'Estudiante de Pregrado', investigation: 'Microbiologia') )
        testUser.save(flush: true)
        def testUser2 = new User(username: 'belen.gonzalez.12@sansano.usm.cl', password: '1234' , userProfile: new UserProfile(name: null, lastName: null, studiesPos: null,universityPos: null, countryPos: null, studiesPre: null,university: 'Santa Maria', country: 'Chile', labCharge: 'Estudiante de Pregrado', investigation: 'Microbiologia') )
        testUser2.save(flush: true)

        UserRole.create testUser, adminRole, true
        UserRole.create testUser2, userRole, true

        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 2

    }
    def destroy = {
    }
}