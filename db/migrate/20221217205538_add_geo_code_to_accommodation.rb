class AddGeoCodeToAccommodation < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :latitude, :float
    add_column :accommodations, :longitude, :float
  end
end
