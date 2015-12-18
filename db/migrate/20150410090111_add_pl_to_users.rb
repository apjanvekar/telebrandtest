class AddPlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pl, :integer
  end
end
