class AddClToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cl, :integer
  end
end
