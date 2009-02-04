class CreateOfficers < ActiveRecord::Migration
  def self.up
    create_table :officers do |t|
    end
  end

  def self.down
    drop_table :officers
  end
end
