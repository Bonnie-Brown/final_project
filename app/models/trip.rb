class Trip < ApplicationRecord

    belongs_to :user
    has_many :accommodations, dependent: :destroy
    has_many :transportations, dependent: :destroy
    has_many :todo_lists, dependent: :destroy
    has_many :todo_items, through: :todo_lists

    def start_time
        self.departure_date
    end

    def end_time
        self.return_date
    end
    

    
end
