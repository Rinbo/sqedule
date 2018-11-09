class RemovePatterForeignkeyFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :patterns, column: :schedule_id
    remove_column :patterns, :schedule_id
  end
end
