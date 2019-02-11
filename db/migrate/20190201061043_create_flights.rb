class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :ftype
      t.string :from
      t.string :destination
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
