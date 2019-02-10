class Flight < ApplicationRecord
  has_one :first
  has_one :business
  has_one :economy
  has_many :bookings

  validates :name, presence: true
  validates :ftype, presence: true
  validates :start_time, presence: true, if: :validstart
  validates :end_time, presence: true, if: :validend
  validates :from, presence: true
  validates :destination, presence: true



  def validstart
    if (start_time < Time.current)
      errors.add(:start_time)
    end
  end

  def validend
    (!end_time.nil? ) ? true : errors.add(:end_time)
    if (end_time.to_time < start_time.to_time + 1500)
      errors.add(:end_time, "should be greater or equal to 15min")
    end
  end


end
