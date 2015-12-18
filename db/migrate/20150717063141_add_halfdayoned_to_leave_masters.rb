class AddHalfdayonedToLeaveMasters < ActiveRecord::Migration
  def change
    add_column :leave_masters, :half_day_on_ed, :date
  end
end
