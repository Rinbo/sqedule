class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.boolean :cleaning, :default => false
      t.date :employment_end
      t.integer :shift_preference

      t.timestamps
    end
  end
end
