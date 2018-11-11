class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :staff, foreign_key: true
      t.boolean :locked_shift_id
      t.boolean :off
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
