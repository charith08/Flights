class Booking < ApplicationRecord
  belongs_to :flight
  before_save :generate_bpnr
  has_many :selectseats

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX }
  validates :seats, presence: true


class << self
   # Returns a random token.
    def new_token
      SecureRandom.hex(4)
    end

end

private

def generate_bpnr
  self.pnr  = Booking.new_token
end


end
