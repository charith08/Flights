class First < ApplicationRecord
  belongs_to :flight
  has_many :seats
  validates :row, presence: true
  validates :seats_in_row, presence: true
  
end
