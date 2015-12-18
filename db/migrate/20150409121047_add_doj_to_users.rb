class AddDojToUsers < ActiveRecord::Migration
  def change
    add_column :users, :doj, :date
  end
end
