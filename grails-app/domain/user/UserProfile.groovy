package user

import security.User

class UserProfile {
    String name
    String lastName
    String studiesPre
    String university
    String country
    String studiesPos
    String universityPos
    String countryPos
    String labCharge
    String investigation
    static belongsTo = [user:User]
    static constraints = {
        name blank: false, nullable: true
        lastName blank: false, nullable: true
        studiesPre blank: false, nullable: true
        university blank: false, nullable: true
        country blank: false, nullable: true
        studiesPos nullable:true
        universityPos nullable: true
        countryPos nullable: true
        labCharge inList: ['Estudiante de Pregrado','Estudiante de Postgrado','Trabajador', 'Jefe de Laboratorio','Colaborador', 'Otros']
        investigation inList: ['Biotecnologia Vegetal', 'Compuestos Bioactivos', 'Microbiologia', 'Biotecnologia Ambiental']
    }
}
