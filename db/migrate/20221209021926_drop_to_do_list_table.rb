class DropToDoListTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :to_do_lists
  end
end
