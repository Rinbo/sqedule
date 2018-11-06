class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.date :date
      t.references :pattern, foreign_key: true
      t.boolean :cleaning, :default => false
      t.integer :staff_req

      t.timestamps
    end
  end
end
