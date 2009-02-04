class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
    end
  end

  def self.down
    drop_table :schools
  end
end
