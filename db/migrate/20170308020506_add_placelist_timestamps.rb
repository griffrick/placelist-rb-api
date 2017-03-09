class AddPlacelistTimestamps < ActiveRecord::Migration[5.0]
  def change
  	add_column :placelists, :created_at, :datetime
  	add_column :placelists, :updated_at, :datetime
  end
end
