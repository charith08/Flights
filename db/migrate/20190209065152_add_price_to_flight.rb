class AddPriceToFlight < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :base_price, :integer
    add_column :firsts, :first_price, :integer
    add_column :businesses, :business_price, :integer
    add_column :economies, :economy_price, :integer
    add_column :seats, :seat_price, :integer
  end
end
