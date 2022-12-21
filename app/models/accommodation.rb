class Accommodation < ApplicationRecord
  # belongs_to :detail
  
  belongs_to :user
  belongs_to :trip

  validates :name, presence: true
  validates :check_in_date, presence: true
  validates :check_in_time, presence: true
  validates :check_out_date, presence: true
  validates :check_out_time, presence: true
  validates :note, length: {maximum: 200}

  geocoded_by :address 
  after_validation :geocode



end
