class Accommodation < ApplicationRecord
  # belongs_to :detail
  
  belongs_to :user
  belongs_to :details #, dependent: :destroy
  belongs_to :trips

end
