class User < ActiveRecord::Base
	has_many :ratings
	has_many :restaurants, :through => :ratings
	has_secure_password
  validates :password, length: { minimum: 6 }
end
