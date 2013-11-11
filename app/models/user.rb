class User < ActiveRecord::Base
	has_many :ratings
	has_many :restaurants, :through => :ratings
	has_secure_password
  
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :name, presence: true
	validates :password, length: { minimum: 6 }

  	def self.search(search)
  	if search
    	where('name LIKE ?', "%#{search}%")
  	else
    	where('name LIKE ?', "%%")
  	end
	end
end
