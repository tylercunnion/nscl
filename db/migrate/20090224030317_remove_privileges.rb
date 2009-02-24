class RemovePrivileges < ActiveRecord::Migration
  def self.up
      remove_column "users", "privileges"
  end

  def self.down
    add_column "users", "privileges", :integer
  end
end
