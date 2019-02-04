class AddFlightToFirst < ActiveRecord::Migration[5.2]
  def change
    add_column :firsts, :flight_id, :integer
  end
end
