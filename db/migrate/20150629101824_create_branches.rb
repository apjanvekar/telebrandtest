class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branch_name

      t.timestamps null: false
    end
  end
end
