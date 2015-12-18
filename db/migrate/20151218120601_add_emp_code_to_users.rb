class AddEmpCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emp_code, :string
  end
end
