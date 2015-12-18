class AddReportTo2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :report_to2, :integer
  end
end
