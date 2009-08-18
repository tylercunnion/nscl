class AddFlagToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :active, :boolean, :default => 1
  end

  def self.down
    remove_column :members, :active
  end
end
