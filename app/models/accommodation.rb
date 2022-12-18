class Accommodation < ApplicationRecord
  # belongs_to :detail
  
  belongs_to :user
  belongs_to :trip

  geocoded_by :address 
  after_validation :geocode



end
