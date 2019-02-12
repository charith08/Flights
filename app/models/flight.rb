class Flight < ApplicationRecord
  has_one :first
  has_one :business
  has_one :economy
  has_many :bookings
  before_save   :downcase_source_and_destination
  validates :name, presence: true
  validates :ftype, presence: true
  validates :start_time, presence: true, if: :validstart
  validates :end_time, presence: true, if: :validend
  validates :from, presence: true, case_sensitive: false
  validates :destination, presence: true, if: :samedestination, case_sensitive: false

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

  def samedestination
    if(from.casecmp(destination) == 0)
      errors.add(:destination, "cannot be same as From ")
    end
  end

  def downcase_source_and_destination
    self.from = from.downcase
    self.destination = destination.downcase
  end

end
