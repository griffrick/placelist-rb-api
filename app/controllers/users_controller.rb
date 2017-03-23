class UsersController < ApplicationController

	def show
		if params[:id].to_i == @current_user.id
			render json: @current_user
		else
			render json: { "errors": "user ids did not match "}
		end
	end


	def update
		user = User.find_by_id(params[:id])
		if user.id == @current_user.id
			user = User.find_by_id(params[:id])
			logger.info user
			params.each { |key, value| user.instance_variable_set('@' + key, value) if key != "id" }
			user.save if user.valid?
			render json: user
		else
			render json: {"errors": "User IDs did not match"}, status: 404
		end

	end


end