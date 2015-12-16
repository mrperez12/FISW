package security

import book.Books
import magazine.Magazines
import proyect.Proyects
import tesisPos.TesisPostgrade
import tesisPre.TesisPregrade
import user.UserProfile


class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService
    static hasOne = [userProfile: UserProfile, tesis: TesisPregrade, tesisPos: TesisPostgrade]
	static hasMany = [book: Books, proyect: Proyects, magazine: Magazines]

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username email: true , blank: false, unique: true
		password blank: false
        userProfile unique: true, nullable: true
        book nullable: true
        proyect nullable: true
		magazine nullable: true
        tesis nullable: true
		tesisPos nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}
