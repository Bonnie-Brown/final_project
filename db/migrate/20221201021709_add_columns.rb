class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :departure_date, :date
    add_column :trips, :return_date, :date
    add_column :trips, :image_url, :text
  end
end
