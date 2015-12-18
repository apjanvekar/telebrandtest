class AddPresentslToUser < ActiveRecord::Migration
  def change
    add_column :users, :presentsl, :integer
  end
end
