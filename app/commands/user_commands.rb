class CreateUserCommand

	prepend SimpleCommand

	def initialize(username, email, password, password_confirmation)
		@username = username
		@email = email
		@password = password
		@password_confirmation = password_confirmation
	end

	def call
		JsonWebToken.encode(user_id: user.id) if user
	end

	private
	attr_accessor :username, :email, :password, :password_confirmation

	def user
		user = User.new(username: username, email: email, password: password, password_confirmation: password_confirmation) 	
		user.authenticate(pasword) if user.save else errors.add :user_validation, 'error occured creating user'
	end

end