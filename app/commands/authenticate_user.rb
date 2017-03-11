
class AuthenticateUser 
	prepend SimpleCommand 

	def initialize(username, password) 
		@username = username 
		@password = password 
	end 

	def call 
		toReturn = JsonWebToken.encode(user_id: user.id) if user 
		puts toReturn
		toReturn
	end 

	private 

	attr_accessor :username, :password 

	def user 
		user = User.find_by_username(username) 
		return user if user && user.authenticate(password) 
		errors.add :user_authentication, 'invalid credentials' 
		nil 
	end 
end
