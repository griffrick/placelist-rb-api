class UserController < ApplicationController
	skip_before_action :authenticate_request 

	def create
		command = CreateUserCommand.call(params[:username], params[:email], params[:password], params[:password_confirmation])
		puts command.success?
		puts command.result
		if command.success?
			render json: { auth_token: command.result }
		else
			render json: { error: command.result }
		end
	end

end