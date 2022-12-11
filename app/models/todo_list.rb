class TodoList < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :todo_items
end
