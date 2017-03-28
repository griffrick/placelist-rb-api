class PlacelistsController < ApplicationController

	#Retrieves all placelists for the current user
	def index
		render json: {'palcelists': @current_user.placelists.to_json}
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
		new_place = Place.new(name: params[:name], place_type: params[:place_type], street_address: params[:street_address], state: params[:state], zip_code: params[:zip_code], lon: params[:lon], lat: params[:lat])
		puts new_place.valid?
		placelist = Placelist.find_by_id(params[:id])
		if new_place.valid?
			placelist.places << new_place 
		else
			render json: {"errors": "invalid place parameters"}
		end	
	end

end