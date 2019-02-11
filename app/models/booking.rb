class Booking < ApplicationRecord
  belongs_to :flight
  before_save :generate_bpnr
  before_destroy :restore
  has_many :selectseats, dependent: :destroy
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX }
  validates :seats, presence: true, if: :validseat


  def restore
        seats1 = Seat.where(:booking_id => id)
        seats1.each do |seat|
          seat.update_attributes(booking_id: nil,available: true)
        end
     	end


    def validseat

      if(seats == 0 || seats ==nil )
        errors.add(:seats, "Number of seats should be atleast 1")
      end

      if(flight.first.num_of_seats < seats)
        errors.add(:seats, "Seats exceeding the availability")
      end

      if(flight.business.num_of_seats < seats)
        errors.add(:seats, "Seats exceeding the availability")
      end

      if(flight.economy.num_of_seats < seats)
        errors.add(:seats, "exceeding the availability")
      end

    end


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
