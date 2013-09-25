# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130826041221) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.string   "slug"
    t.integer  "position"
    t.boolean  "use_privacy",     :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"
  add_index "categories", ["organization_id"], :name => "index_categories_on_organization_id"
  add_index "categories", ["position"], :name => "index_categories_on_position"
  add_index "categories", ["slug"], :name => "index_categories_on_slug"
  add_index "categories", ["use_privacy"], :name => "index_categories_on_use_privacy"

  create_table "categories_users", :force => true do |t|
    t.integer "category_id"
    t.integer "user_id"
  end

  add_index "categories_users", ["category_id"], :name => "index_categories_users_on_category_id"
  add_index "categories_users", ["user_id"], :name => "index_categories_users_on_user_id"

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.integer  "users_count"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "report_attachments", :force => true do |t|
    t.string   "image_attachment"
    t.string   "report_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "report_notes", :force => true do |t|
    t.text     "notes"
    t.integer  "report_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "report_name"
    t.string   "category"
    t.string   "department"
    t.string   "system"
    t.string   "owner"
    t.date     "last_updated"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "module"
    t.text     "frequency"
    t.text     "status"
    t.text     "usage"
    t.integer  "reportid"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "admin"
    t.string   "name"
    t.boolean  "active"
    t.integer  "organization_id"
  end

  add_index "users", ["organization_id"], :name => "index_users_on_organization_id"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
