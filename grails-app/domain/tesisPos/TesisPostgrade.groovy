package tesisPos

import security.User

class TesisPostgrade {
    String nameTesisPos
    String tesisPosUniversity
    String tesisPosCountry
    String tutorPosName
    String cotutorPosName
    String filename
    String fullPath
    Date uploadDate = new Date()
    static belongsTo = [user: User]
    static constraints = {
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
    }
}
