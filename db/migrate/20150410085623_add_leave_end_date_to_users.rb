class AddLeaveEndDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :leave_end_date, :date
  end
end
