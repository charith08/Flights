class AddTotalNoOfSeatsToClasses < ActiveRecord::Migration[5.2]
  def change
    add_column :firsts, :num_of_seats, :integer
    add_column :businesses, :num_of_seats, :integer
    add_column :economies, :num_of_seats, :integer
  end
end
