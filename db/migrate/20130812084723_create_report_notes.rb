class CreateReportNotes < ActiveRecord::Migration
  def change
    create_table :report_notes do |t|
      t.text :notes
      t.integer :report_id

      t.timestamps
    end
  end
end
