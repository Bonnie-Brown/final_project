class AddGeoCodeToTransportation < ActiveRecord::Migration[7.0]
  def change
    add_column :transportations, :latitude, :float
    add_column :transportations, :longitude, :float
  end
end
