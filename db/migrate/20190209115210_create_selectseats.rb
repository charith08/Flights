class CreateSelectseats < ActiveRecord::Migration[5.2]
  def change
    create_table :selectseats do |t|
      t.integer :seatnumber
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
