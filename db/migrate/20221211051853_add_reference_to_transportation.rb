class AddReferenceToTransportation < ActiveRecord::Migration[7.0]
  def change
    add_reference :transportations, :trip, null: false, foreign_key: true
  end
end
