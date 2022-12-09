class TodoList < ApplicationRecord
  belongs_to :trip
  has_many :todo_items
end
