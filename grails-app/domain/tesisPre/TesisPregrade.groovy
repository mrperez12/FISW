package tesisPre

import security.User

class TesisPregrade {
    String nameTesis
    String tesisUniversity
    String tesisCountry
    String tutorName
    String cotutorName
    String filename
    String fullPath
    Date uploadDate = new Date()
    static scaffold = true
    static belongsTo = [user: User]
    static constraints = {
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
    }
    static searchTesisPre = {
        nameTesis
        tesisUniversity
        tesisCountry
        tutorName
        cotutorName
    }
}

