class TodoItem < ApplicationRecord
  belongs_to :todo_list
  belongs_to :user

  scope :completed, -> do
    where(completed: true)
  end

  

  
  
end
