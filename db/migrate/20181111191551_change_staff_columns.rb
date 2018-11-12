class ChangeStaffColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :staffs, :cleaning, :boolean
    add_column :staffs, :primary_role, :string
    add_column :staffs, :roles, :text, array:true, default: []
  end
end
