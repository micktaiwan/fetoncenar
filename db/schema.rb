# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091204200116) do

  create_table "chapters", :force => true do |t|
    t.integer  "script_id",  :null => false
    t.integer  "order"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descr"
  end

  create_table "knols", :force => true do |t|
    t.string   "name"
    t.text     "descr"
    t.integer  "script_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "paragraphs", :force => true do |t|
    t.integer  "chapter_id"
    t.text     "text"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scripts", :force => true do |t|
    t.string   "name"
    t.text     "pitch"
    t.text     "trailer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "public",           :default => 0
    t.text     "real_story"
    t.integer  "paragraphs_count", :default => 0
  end

  create_table "user_scripts", :id => false, :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "script_id",                 :null => false
    t.integer  "rights",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "identity_url"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
