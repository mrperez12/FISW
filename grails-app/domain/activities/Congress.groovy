package activities

import security.User

class Congress {
    String nameCongress
    String date
    String cityCongress
    String countryCongress
    String poster
    String filename
    String fullPath
    Date uploadDate = new Date()
    static scaffold = true
    static belongsTo = [user: User]
    static constraints = {
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
    }
    static searchCongresses = {
        nameCongress
        date
        cityCongress
        countryCongress
        poster
    }

}
