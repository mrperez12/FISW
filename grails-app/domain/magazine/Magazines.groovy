package magazine

import security.User

class Magazines {
    String authorMagazine
    String titleMagazine
    String year
    String magazine
    String keywords
    String areaMagazine
    String filename
    String fullPath
    Date uploadDate = new Date()
    static belongsTo = [user: User]
    static constraints = {
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
        areaMagazine inList: ['Biotecnologia Vegetal', 'Compuestos Bioactivos', 'Microbiologia', 'Biotecnologia Ambiental', 'Otros']
    }
}
