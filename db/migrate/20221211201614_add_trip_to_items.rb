class AddTripToItems < ActiveRecord::Migration[7.0]
  def change
      def change
    remove_reference :todo_items, :todo_lists
    add_reference :todo_items, :trip, null: false, foreign_key: true
  end
  end
end
