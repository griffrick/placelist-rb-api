class CreatePlacelists < ActiveRecord::Migration[5.0]
  def change
    create_table :placelists do |t|

      t.timestamps
    end
  end
end
