class Flight < ApplicationRecord
  has_one :first

  before_save :generate_pnr
  validates :name, presence: true
  validates :ftype, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :from, presence: true
  validates :destination, presence: true

  class << self
     # Returns a random token.
      def new_token
        SecureRandom.hex(2)
      end

  end

private

  def generate_pnr
    self.fpnr  = Flight.new_token
  end


end
