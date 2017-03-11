class PlacelistPlace < ApplicationRecord
	belongs_to :place
	belongs_to :placelist
end