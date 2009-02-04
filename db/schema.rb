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

ActiveRecord::Schema.define(:version => 20090204204902) do

  create_table "links", :force => true do |t|
    t.string  "section",     :limit => 0, :default => "National", :null => false
    t.string  "url",                      :default => "",         :null => false
    t.string  "name",                     :default => "",         :null => false
    t.text    "description"
    t.integer "order_no",    :limit => 6
  end

  create_table "members", :force => true do |t|
    t.integer "state_id"
    t.integer "school_id"
    t.string  "last",            :limit => 45
    t.string  "first",           :limit => 45
    t.integer "public",          :limit => 1
    t.integer "grad_year",       :limit => 4
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
  end

  create_table "officers", :force => true do |t|
    t.string  "name",      :limit => 50
    t.integer "member_id"
    t.string  "link",      :limit => 50
    t.string  "email",     :limit => 100
  end

  create_table "publications", :force => true do |t|
    t.string   "pub_type",              :null => false
    t.date     "date",                  :null => false
    t.integer  "editor_id",             :null => false
    t.string   "publication_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  add_index "schools", ["name"], :name => "name", :unique => true

  create_table "states", :force => true do |t|
    t.string "name",                      :default => "", :null => false
    t.string "abbreviation", :limit => 2
  end

end
