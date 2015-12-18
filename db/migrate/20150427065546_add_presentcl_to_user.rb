class AddPresentclToUser < ActiveRecord::Migration
  def change
    add_column :users, :presentcl, :integer
  end
end
