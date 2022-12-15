class UndoLastMigration < ActiveRecord::Migration[7.0]
  def change
     add_column :accommodations, :check_in_date, :date
     add_column :accommodations, :check_out_date, :date
     add_column :accommodations, :check_in_time, :time
     add_column :accommodations, :check_out_time, :time
     remove_column :accommodations, :check_in
     remove_column :accommodations, :check_out
  end
end
