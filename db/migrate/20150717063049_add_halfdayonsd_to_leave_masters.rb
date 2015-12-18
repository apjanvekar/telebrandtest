class AddHalfdayonsdToLeaveMasters < ActiveRecord::Migration
  def change
    add_column :leave_masters, :half_day_on_sd, :date
  end
end
