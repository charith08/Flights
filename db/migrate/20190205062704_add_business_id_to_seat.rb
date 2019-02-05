class AddBusinessIdToSeat < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :business_id, :integer
  end
end
