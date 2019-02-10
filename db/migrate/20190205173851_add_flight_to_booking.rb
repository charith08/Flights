class AddFlightToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :flight_id, :integer
  end
end
