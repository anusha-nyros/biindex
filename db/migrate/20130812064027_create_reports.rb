class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_name
      t.string :category
      t.string :department
      t.string :system
      t.string :owner
      t.date :last_updated
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
