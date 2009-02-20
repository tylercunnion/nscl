class RemoveSectionFromLink < ActiveRecord::Migration
  def self.up
    remove_column :links, :section
    remove_column :links, :order_no
  end

  def self.down
    add_column :links, :order_no, :integer,    :limit => 2
    add_column :links, :section, :string,     :limit => 0, :default => "National", :null => false
  end
end
