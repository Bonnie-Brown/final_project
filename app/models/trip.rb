class Trip < ApplicationRecord

    belongs_to :user
    has_many :accommodations, dependent: :destroy
    has_many :transportations, dependent: :destroy
    has_many :todo_lists, dependent: :destroy
    has_many :todo_items, through: :todo_lists
    

    
end
