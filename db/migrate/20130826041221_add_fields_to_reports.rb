class AddFieldsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :module, :text
    add_column :reports, :frequency, :text
    add_column :reports, :status, :text
    add_column :reports, :usage, :text
    add_column :reports, :reportid, :integer
  end
end
