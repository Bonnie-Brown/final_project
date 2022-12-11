class FixReferenceInLists < ActiveRecord::Migration[7.0]
  def change
     remove_reference :todo_lists, :trips
      add_reference :todo_lists, :trip, null: false, foreign_key: true
  end
end
