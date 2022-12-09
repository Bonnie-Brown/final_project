class EditReferenceInAccommodationTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :accommodations, :trip
    add_reference :accommodations, :detail, null: false, foreign_key: true
  end
end
