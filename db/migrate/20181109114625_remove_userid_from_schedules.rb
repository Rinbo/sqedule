class RemoveUseridFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :schedules, column: :user_id 
  end
end
