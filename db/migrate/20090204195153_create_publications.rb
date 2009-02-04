class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications, :force => true do |t|
      t.column "type", :string, :null => false
      t.column "date", :date, :null => false      
      t.column "editor_id", :integer, :null => false
      t.column "publication_file_name", :string      
      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
