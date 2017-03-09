class CreatePlacesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
    	t.string :name
    	t.string :place_type
    	t.string :street_address
    	t.string :state
    	t.string :zip_code
    	t.float :lon
    	t.float :lat
    end
  end
end
