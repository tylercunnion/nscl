class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
    end
  end

  def self.down
    drop_table :publications
  end
end
