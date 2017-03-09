class AddPlacesTimestamps < ActiveRecord::Migration[5.0]
  def change
  	add_column :places, :created_at, :datetime
  	add_column :places, :updated_at, :datetime
  end
end
