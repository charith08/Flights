class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.string :pnr
      t.integer :seats

      t.timestamps
    end
  end
end
