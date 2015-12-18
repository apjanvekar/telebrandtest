class AddHalfDayToLeaveMasters < ActiveRecord::Migration
  def change
    add_column :leave_masters, :half_day, :string
  end
end
