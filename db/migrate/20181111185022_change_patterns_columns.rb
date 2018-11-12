class ChangePatternsColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :patterns, :break_length, :integer
    add_column :patterns, :break_length, :time
    remove_column :patterns, :shift_length, :integer
    add_column :patterns, :shift_length, :time
    rename_column :patterns, :cleaning, :primary_role
    change_column :patterns, :primary_role, :string
  end
end
