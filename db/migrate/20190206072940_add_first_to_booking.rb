class AddFirstToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :first_id, :integer
  end
end
