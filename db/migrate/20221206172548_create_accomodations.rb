class CreateAccomodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accomodations do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.string :address
      t.string :phone
      t.string :email
      t.date :check_in_date
      t.date :check_out_date
      t.time :check_in_time
      t.time :check_out_time
      t.text :note






      t.timestamps
    end
  end
end
