class AddPermissions < ActiveRecord::Migration
  def self.up
    add_column :users, :privileges, :integer
  end

  def self.down
    remove_column :users, :privileges
  end
end
