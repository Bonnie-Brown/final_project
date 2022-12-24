class AddAddressToTransportation < ActiveRecord::Migration[7.0]
  def change
    add_column :transportations, :address, :string
  end
end
