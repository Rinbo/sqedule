class AddFieldsToStaff < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :employment_start, :date
    add_column :staffs, :workrate, :decimal
  end
end
