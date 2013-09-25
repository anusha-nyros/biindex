class CreateReportAttachments < ActiveRecord::Migration
  def change
    create_table :report_attachments do |t|
      t.string :image_attachment
      t.string :report_id

      t.timestamps
    end
  end
end
