# frozen_string_literal: true

class TodoItemReflex < ApplicationReflex

  def mark_incomplete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: true)

  end

  def mark_complete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: false)
  end

end
