package book

import security.User

class Books {
    String author
    String title
    String date
    String isbn
    String editorial
    String filename
    String fullPath
    Date uploadDate = new Date()
    static scaffold = true
    static belongsTo = [user: User]
    static constraints = {
        author (blank:false,nullable:false)
        title (blank:false,nullable:false)
        date (blank:false,nullable:false)
        isbn (blank:false,nullable:false)
        editorial (blank:false,nullable:false)
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
    }
    static searchBooks = {
        author
        title
        date
        isbn
        editorial
    }
}

