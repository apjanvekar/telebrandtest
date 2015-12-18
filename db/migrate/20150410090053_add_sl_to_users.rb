class AddSlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sl, :integer
  end
end
