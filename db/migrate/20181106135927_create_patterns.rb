class CreatePatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :patterns do |t|
      t.time :shift_start
      t.integer :shift_length
      t.integer :break_length
      t.boolean :cleaning
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
