class First < ApplicationRecord


  belongs_to :flight
  has_many :seats

  before_save :generate_fcpnr
  validates :row, presence: true
  validates :seats_in_row, presence: true

  class << self
     # Returns a random token.
      def new_token
        SecureRandom.hex(1)
      end

  end

private

  def generate_fcpnr
    self.fcpnr  = self.fcpnr + First.new_token
  end

end
