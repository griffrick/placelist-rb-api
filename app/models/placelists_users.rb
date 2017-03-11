class PlacelistUser < ApplicationRecord
	belongs_to :user
	belongs_to :placelist
end