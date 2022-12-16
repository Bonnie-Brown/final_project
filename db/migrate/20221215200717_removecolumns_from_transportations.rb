class RemovecolumnsFromTransportations < ActiveRecord::Migration[7.0]
  def change
    remove_column :transportations, :arrival_date, :date
    remove_column :transportations, :departure_time, :time
  end
end
