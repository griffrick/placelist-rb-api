class CreateUsersPlacelistsJoinTable < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :users, :placelists do |t|
  		t.index :user_id
  		t.index :placelist_id
  	end
  end
end
