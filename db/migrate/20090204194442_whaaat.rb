class Whaaat < ActiveRecord::Migration
  def self.up
    create_table "links", :force => true do |t|
      t.column "section",     :string,  :limit => 0, :default => "National", :null => false
      t.column "url",         :string,               :default => "",         :null => false
      t.column "name",        :string,               :default => "",         :null => false
      t.column "description", :text
      t.column "order_no",    :integer, :limit => 6
    end

    create_table "members", :force => true do |t|
      t.column "state_id",        :integer
      t.column "school_id",       :integer
      t.column "last",            :string,  :limit => 45
      t.column "first",           :string,  :limit => 45
      t.column "public",          :integer, :limit => 1
      t.column "grad_year",       :integer, :limit => 4
      t.column "email",           :string,  :limit => 45
      t.column "home_apt",        :string,  :limit => 45
      t.column "home_address",    :string,  :limit => 100
      t.column "home_city",       :string,  :limit => 45
      t.column "home_state_id",   :integer
      t.column "home_zip",        :string,  :limit => 5
      t.column "school_apt",      :string,  :limit => 45
      t.column "school_address",  :string,  :limit => 100
      t.column "school_city",     :string,  :limit => 45
      t.column "school_state_id", :integer
      t.column "school_zip",      :string,  :limit => 5
      t.column "phone",           :string,  :limit => 10
      t.column "school_name",     :string,  :limit => 100
    end

    create_table "officers", :force => true do |t|
      t.column "name",      :string,  :limit => 50
      t.column "member_id", :integer
      t.column "link",      :string,  :limit => 50
      t.column "email",     :string,  :limit => 100
    end

    create_table "schools", :force => true do |t|
      t.column "name", :string, :default => "", :null => false
    end

    add_index "schools", ["name"], :name => "name", :unique => true

    create_table "states", :force => true do |t|
      t.column "name",         :string,              :default => "", :null => false
      t.column "abbreviation", :string, :limit => 2
    end
  end

  def self.down
    drop_table :links
    drop_table :members
    drop_table :officers
    drop_table :schools
    drop_table :states
  end
end
