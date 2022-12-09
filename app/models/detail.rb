class Detail < ApplicationRecord
    belongs_to :trip
    has_many :accommodations

end
