class Trip < ApplicationRecord

    belongs_to :user
    has_many :details #, dependent: :destroy
    has_many :accommodations, through: :details

    has_many :todo_lists

    
end
