class AddReferenceToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_reference :accommodations, :trip, null: false, foreign_key: true
  end
end
