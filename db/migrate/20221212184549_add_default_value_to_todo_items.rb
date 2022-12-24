class AddDefaultValueToTodoItems < ActiveRecord::Migration[7.0]
  def change
    change_column :todo_items, :completed, :boolean, :default => false
  end
end
