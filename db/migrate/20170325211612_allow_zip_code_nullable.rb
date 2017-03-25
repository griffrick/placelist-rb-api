class AllowZipCodeNullable < ActiveRecord::Migration[5.0]
  def change
  	change_column_null :places, :zip_code, true
  	change_column_default :places, :zip_code, nil
  end
end
