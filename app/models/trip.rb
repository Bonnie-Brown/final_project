class Trip < ApplicationRecord

    belongs_to :user
    has_many :accommodations 
    has_many :transportations
    has_many :todo_lists

    
end
