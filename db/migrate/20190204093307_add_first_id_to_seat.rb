class AddFirstIdToSeat < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :first_id, :integer
  end
end
