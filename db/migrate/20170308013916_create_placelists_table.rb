class CreatePlacelistsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :placelists do |t|
    	t.string :title
    	t.references :author, foreign_key: { to_table: :users }
    end
  end
end
