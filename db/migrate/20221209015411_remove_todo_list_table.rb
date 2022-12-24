class RemoveTodoListTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :todo_lists
  end
end
