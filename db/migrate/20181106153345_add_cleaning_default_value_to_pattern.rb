class AddCleaningDefaultValueToPattern < ActiveRecord::Migration[5.2]
  def change
    change_column :patterns, :cleaning, :boolean, :default => false
  end
end
