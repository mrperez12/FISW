package proyect

import security.User

class Proyects {
    String start
    String finish
    String proyectName
    String proyectCharge
    String others
    static belongsTo = [user: User]
    static constraints = {
        start nullable: true
        finish nullable: true
        proyectName nullable: true
        proyectCharge nullable: true
        others nullable: true
    }
}
