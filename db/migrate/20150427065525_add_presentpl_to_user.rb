class AddPresentplToUser < ActiveRecord::Migration
  def change
    add_column :users, :presentpl, :integer
  end
end
