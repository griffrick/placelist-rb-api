class CreateUserCommand

	prepend SimpleCommand

	def initialize(username, email, password, password_confirmation)
		@username = username
		@email = email
		@password = password
		@password_confirmation = password_confirmation
	end

	def call
		user_id = user.id if user
		return errors[:user_validation] if errors[:user_validation]
		JsonWebToken.encode(user_id: user_id)
	end

	private
	attr_accessor :username, :email, :password, :password_confirmation

	def user
		emailExists = User.find_by_email(email)
		errors.add :user_validation, 'email already exists' if emailExists

		usernameExists = User.find_by_username(username)
		errors.add :user_validation, 'username already exists' if usernameExists
		
		user = User.new(username: username, email: email, password: password, password_confirmation: password_confirmation) 	
		if user.save 
			@current_user = user
			user user.authenticate(password)
		else 
			errors.add :user_validation, 'error occured creating user'
		end
	end

end