class PlacelistsController < ApplicationController

	before_action :authenticate_request

	#Retrieves all placelists for the current user
	def index
		render json: @current_user.placelists
	end

end