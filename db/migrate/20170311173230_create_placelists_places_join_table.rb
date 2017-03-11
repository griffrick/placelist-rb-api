class CreatePlacelistsPlacesJoinTable < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :placelists, :places do |t|
  		t.index :placelist_id
  		t.index :place_id
  	end
  end
end
