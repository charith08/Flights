class CreateFirsts < ActiveRecord::Migration[5.2]
  def change
    create_table :firsts do |t|
      t.integer :row
      t.integer :seats_in_row

      t.timestamps
    end
  end
end
