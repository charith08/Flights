class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :class_id
      t.string :spnr
      t.string :class_pnr

      t.timestamps
    end
  end
end
