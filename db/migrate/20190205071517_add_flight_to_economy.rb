class AddFlightToEconomy < ActiveRecord::Migration[5.2]
  def change
    add_column :economies, :flight_id, :integer
  end
end
