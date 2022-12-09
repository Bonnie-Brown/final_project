class CreateTodoLists < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_lists do |t|
      t.text :description
      t.references :trips, null: false, foreign_key: true

      t.timestamps
    end
  end
end
