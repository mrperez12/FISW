package user

import security.User

class UserProfile {
    String name
    String lastName
    String studiesPre
    String studiesPos
    String labCharge
    String investigation
    static belongsTo = [user:User]
    static constraints = {
        name nullable: true
        lastName nullable: true
        studiesPre nullable: true
        studiesPos nullable:true
        labCharge inList: ['Estudiante de Pregrado','Estudiante de Postgrado','Trabajador', 'Jefe de Laboratorio','Colaborador', 'Otros']
        investigation inList: ['Biotecnologia Vegetal', 'Compuestos Bioactivos', 'Microbiologia', 'Biotecnologia Ambiental']
    }
}
