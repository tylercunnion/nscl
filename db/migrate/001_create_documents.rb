class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
    end
  end

  def self.down
    drop_table :documents
  end
end
