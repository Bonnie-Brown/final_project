class UpdateReferenceInTodoItemTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :todo_items, :trip, null: false, foreign_key: true
  end
end
