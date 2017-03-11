class PlacesController < ApplicationController

	before_action :authenticate_request

	#Shows all places
	def index
		render json: Place.all
	end

	def show (attributes = {})
		place = Place.find_by_id(params[:id])
		render json: place if place
		render json: {"errors": "place with id #{params[:id]} not found"}
	end

	def update
		
	end

	def destroy

	end

end