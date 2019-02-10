class AddSeatnoToSeat < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :seatno, :integer
  end
end
