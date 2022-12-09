class ChangeModelNameToAccommodation < ActiveRecord::Migration[7.0]
  def change
    rename_table :accomodations, :accommodations
  end
end
