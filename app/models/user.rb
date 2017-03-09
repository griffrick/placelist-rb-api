class User < ApplicationRecord

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	before_save { email.downcase! }

	has_secure_password

	has_and_belongs_to_many :places
	has_and_belongs_to_many :placelists

	validates :username, presence: true
	# validates :first_name, presence: true
	# validates :last_name, presence: true
	validates :email, presence: true,
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }				  

	def initialize(attributes = {})
		super(attributes)
	end
	
end
