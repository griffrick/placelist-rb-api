class PlacelistsController < ApplicationController

	#Retrieves all placelists for the current user
	def index
		render json: {'placelists': @current_user.placelists}
	end

	def create
		placelist = Placelist.new(title: params[:title], author_id: @current_user.id)
		if placelist.save
			@current_user.placelists << placelist
			render json: placelist if placelist.valid? && placelist.save
		else
			render json: {"errors": placelist.errors}
		end
	end

	def update
		placelist = Placelist.find_by_id(params[:id])
		puts params[:place]
	end

	def add_place
		puts params.inspect
		puts params[:name]
		placeParams = params[:place]
		new_place = Place.new(name: placeParams[:name], place_type: placeParams[:place_type], street_address: placeParams[:street_address], state: placeParams[:state], zip_code: placeParams[:zip_code], lon: placeParams[:lon], lat: placeParams[:lat])
		puts new_place.valid?
		placelist = Placelist.find_by_id(params[:id])
		if new_place.valid?
			placelist.places << new_place 
		else
			render json: {"errors": "invalid place parameters"}
		end	
	end

end