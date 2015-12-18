class CreateLeaveMasters < ActiveRecord::Migration
  def change
    create_table :leave_masters do |t|
     t.date :start_date
     t.date :end_date
     t.string :leave_type
     t.text :reason_for_leave 
     t.string :status
     t.string :rejection_reason
     t.integer :user_id	
     t.integer :no_of_leave_days
     t.integer :no_of_holiday 
     t.integer :leave_without_pay 
     t.date :remark_date
     t.date :apply_date
     t.timestamps null: false

    end
  end
end
