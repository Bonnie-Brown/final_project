class ChangeColumnsinAccommodation < ActiveRecord::Migration[7.0]
  def change
     remove_column :accommodations, :check_in_date
     remove_column :accommodations, :check_out_date
     remove_column :accommodations, :check_in_time
     remove_column :accommodations, :check_out_time
     add_column :accommodations, :check_in, :datetime
     add_column :accommodations, :check_out, :datetime
  end
end
