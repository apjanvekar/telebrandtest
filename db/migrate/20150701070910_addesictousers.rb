class Addesictousers < ActiveRecord::Migration
  def change
  	add_column :users, :esic, :integer
  end
end
