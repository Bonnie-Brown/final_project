class TodoItem < ApplicationRecord
  belongs_to :todo_list
  belongs_to :trip
  belongs_to :user
end
