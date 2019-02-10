class AddBusinesseconomyToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :business_id, :integer
    add_column :bookings, :economy_id, :integer
  end
end
