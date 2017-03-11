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
		if emailExists
			errors.add :user_validation, 'email already exists'
		end

		usernameExists = User.find_by_username(username)
		if usernameExists
			errors.add :user_validation, 'username already exists'
		end

		user = User.new(username: username, email: email, password: password, password_confirmation: password_confirmation) 	
		
		if user.save 
			user user.authenticate(password)
		else 
			errors.add :user_validation, 'error occured creating user'
		end
	end

end