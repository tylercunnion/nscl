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

ActiveRecord::Schema.define(:version => 20090817203315) do

  create_table "blog_post_categories", :force => true do |t|
    t.integer  "blog_post_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "author_id"
    t.integer  "published"
    t.datetime "publish_date"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string "url",         :default => "", :null => false
    t.string "name",        :default => "", :null => false
    t.text   "description"
  end

  create_table "members", :force => true do |t|
    t.integer "state_id"
    t.integer "school_id"
    t.string  "last",            :limit => 45
    t.string  "first",           :limit => 45
    t.integer "public"
    t.integer "grad_year"
    t.string  "email",           :limit => 45
    t.string  "home_apt",        :limit => 45
    t.string  "home_address",    :limit => 100
    t.string  "home_city",       :limit => 45
    t.integer "home_state_id"
    t.string  "home_zip",        :limit => 5
    t.string  "school_apt",      :limit => 45
    t.string  "school_address",  :limit => 100
    t.string  "school_city",     :limit => 45
    t.integer "school_state_id"
    t.string  "school_zip",      :limit => 5
    t.string  "phone",           :limit => 10
    t.string  "school_name",     :limit => 100
    t.boolean "active",                         :default => true
  end

  create_table "officers", :force => true do |t|
    t.string  "name",      :limit => 50
    t.integer "member_id"
    t.string  "link",      :limit => 50
    t.string  "email",     :limit => 100
  end

  create_table "page_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "address"
    t.text     "body"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.string   "pub_type",              :null => false
    t.date     "date",                  :null => false
    t.string   "publication_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "schools", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  add_index "schools", ["name"], :name => "name", :unique => true

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "states", :force => true do |t|
    t.string "name",                      :default => "", :null => false
    t.string "abbreviation", :limit => 2
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
