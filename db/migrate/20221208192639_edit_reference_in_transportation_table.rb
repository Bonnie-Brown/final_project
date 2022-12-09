class EditReferenceInTransportationTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :transportations, :trip
    add_reference :transportations, :detail, null: false, foreign_key: true
  end
end
