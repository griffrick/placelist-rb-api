class CreatePlacesPlacelists < ActiveRecord::Migration[5.0]
  def change
    create_table :places_placelists do |t|
      t.references :place, foreign_key: true
      t.references :placelist, foreign_key: true
    end
  end
end
