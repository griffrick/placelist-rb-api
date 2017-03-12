class PlacelistsController < ApplicationController

	#Retrieves all placelists for the current user
	def index
		render json: @current_user.placelists
	end

	def create
		placelist = Placelist.new(title: params[:title], author_id: @current_user.id)
		render json: placelist if placelist.valid? && placelist.save
	end

end