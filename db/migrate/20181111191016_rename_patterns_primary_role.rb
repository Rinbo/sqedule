class RenamePatternsPrimaryRole < ActiveRecord::Migration[5.2]
  def change
    remove_column :patterns, :primary_role, :string
    add_column :patterns, :primary_role, :string
  end
end
