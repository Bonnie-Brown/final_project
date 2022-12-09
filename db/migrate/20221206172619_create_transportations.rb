class CreateTransportations < ActiveRecord::Migration[7.0]
  def change
    create_table :transportations do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :company_name
      t.date :departure_date
      t.time :check_in_time
      t.time :arrival_time
      t.text :note
      t.timestamps
    end
  end
end
