class Accommodation < ApplicationRecord
  # belongs_to :detail
  
  belongs_to :user
  
  belongs_to :trip

end
