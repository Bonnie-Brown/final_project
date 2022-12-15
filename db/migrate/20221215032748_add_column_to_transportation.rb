class AddColumnToTransportation < ActiveRecord::Migration[7.0]
  def change
    add_column :transportations, :arrival_date, :date
    add_column :transportations, :departure_time, :time
  end
end
