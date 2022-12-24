class RemovereferenceToTripsFromTodoItems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :todo_items, :trip
  end
end
