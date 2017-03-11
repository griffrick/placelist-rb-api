class DeleteErroneousTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :places_placelists
  end
end
