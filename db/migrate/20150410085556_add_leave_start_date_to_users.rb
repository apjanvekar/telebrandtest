class AddLeaveStartDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :leave_start_date, :date
  end
end
