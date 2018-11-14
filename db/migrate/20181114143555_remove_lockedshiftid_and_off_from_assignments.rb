class RemoveLockedshiftidAndOffFromAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :locked_shift_id
    remove_column :assignments, :off
  end
end
