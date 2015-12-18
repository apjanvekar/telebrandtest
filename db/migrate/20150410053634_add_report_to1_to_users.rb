class AddReportTo1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :report_to1, :integer
  end
end
