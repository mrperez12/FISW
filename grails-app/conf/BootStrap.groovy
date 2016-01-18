import security.*
import user.UserProfile

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testProfile = new UserProfile(name: 'Lala', lastName:'Lolo', studiesPos: null,universityPos: null, countryPos: null, studiesPre: 'Dostor', university: 'Santo Pancracio', country: 'Chile', labCharge: 'Estudiante de Pregrado', investigation: 'Microbiologia')
        def testUser = new User(username: 'asd@asd.cl', password: '1234').save()
        testProfile.user = testUser
        testProfile.save(flush: true)

        def testProfile2 = new UserProfile(name: 'Asd', lastName: 'Dsa', studiesPos: null,universityPos: null, countryPos: null, studiesPre: null,university: 'Santa Maria', country: 'Chile', labCharge: 'Estudiante de Pregrado', investigation: 'Microbiologia')
        def testUser2 = new User(username: 'dsa@dsa.cl', password: '1234').save()
        testProfile2.user = testUser2
        testProfile2.save(flush: true)

        UserRole.create testUser, adminRole, true
        UserRole.create testUser2, userRole, true

        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 2

    }
    def destroy = {
    }
}