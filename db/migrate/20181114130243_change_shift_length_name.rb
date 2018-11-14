class ChangeShiftLengthName < ActiveRecord::Migration[5.2]
  def change
    rename_column :patterns, :shift_length, :shift_end
  end
end
