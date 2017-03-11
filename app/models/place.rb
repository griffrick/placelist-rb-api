class Place < ApplicationRecord

	has_and_belongs_to_many :placelists
	has_and_belongs_to_many :users

	validates :name, presence: true
	validates :place_type, presence: true
	validates :street_address, presence: true
	validates :state, presence: true
	validates :zip_code, presence: true, length: { is: 5 }
	validates :lon, presence: true
	validates :lat, presence: true

	def initialize(attributes = {})
		super(attributes)
	end

end