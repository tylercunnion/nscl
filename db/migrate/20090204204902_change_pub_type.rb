class ChangePubType < ActiveRecord::Migration
  def self.up
    rename_column :publications, :type, :pub_type
  end

  def self.down
    rename_column :publications, :pub_type, :type
  end
end
