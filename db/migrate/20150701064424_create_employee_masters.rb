class CreateEmployeeMasters < ActiveRecord::Migration
  def change
    create_table :employee_masters do |t|
      t.string :emp_code
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_join
      t.boolean :gender
      t.date :leave_start_date
      t.date :leave_end_date
      t.integer :yearly_alocated_sl
      t.integer :yearly_alocated_pl
      t.integer :yearly_alocated_cl
      t.integer :group_id
      t.integer :branch_id
      t.integer :unit_id
      t.integer :department_id
      t.integer :avaiable_sl
      t.integer :available_pl
      t.integer :avaiable_cl

      t.timestamps null: false
    end
  end
end
