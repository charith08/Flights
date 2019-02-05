class AddEconomyIdToSeat < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :economy_id, :integer
  end
end
