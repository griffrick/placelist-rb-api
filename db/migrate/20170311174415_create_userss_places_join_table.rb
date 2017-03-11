class CreateUserssPlacesJoinTable < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :users, :places do |t|
  		t.index :user_id
  		t.index :place_id
  	end
  end
end
