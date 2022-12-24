class Transportation < ApplicationRecord
 
  belongs_to :user
  belongs_to :trip

  validates :company_name, presence: true
  validates :departure, presence: true
  validates :check_in_time, presence: true
  validates :arrival, presence: true
  validates :note, length: {maximum: 200}

  geocoded_by :address 
  after_validation :geocode


end
