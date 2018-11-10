class AddReferencesBetweenStaffAndUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :staffs, :user, foreign_key: true
  end
end
