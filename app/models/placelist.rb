class Placelist < ApplicationRecord

	belongs_to :author, class_name: "User"

	has_and_belongs_to_many :users
	has_and_belongs_to_many :places

	validates :title, presence: true
	validates :author_id, presence: true

	def initialize(attributes = {})
		super(attributes)
	end

end
