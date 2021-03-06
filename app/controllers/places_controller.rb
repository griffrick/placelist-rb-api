class PlacesController < ApplicationController

	#Shows all places
	def index
		render json: Place.all
	end

	def create
		place = Place.new(address: params[:address], name: params[:name], place_type: params[:place_type], street_address: params[:street_address], state: params[:state], zip_code: params[:zip_code], lon: params[:lon], lat: params[:lat])
		return render json: place if place.save!
		return render status: 500, json: {"errors": place.errors}
	end

	def show
		place = Place.find_by_id(params[:id])
		return render json: place if place
		render status: 500, json: {"errors": "place with id #{params[:id]} not found"}
	end

	# Not sure what to do about update.... Need to discuss format of the request to the API
	# def update
	# 	place = Place.find_by_id(params[:id])
	# 	new_place = Place.new(params[:place])

	# end

	# Do we even want to destroy a place? maybe should be some maps integration here?
	def destroy
		place = Place.find_by_id(params[:id])
		place.destroy!
	end

end