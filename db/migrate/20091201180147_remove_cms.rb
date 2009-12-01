class RemoveCms < ActiveRecord::Migration
  def self.up
    drop_table :page_categories
    drop_table :pages
  end

  def self.down
    create_table :pages, :force => true do |t|
      t.string :title
      t.string :address
      t.text :body
      t.integer :category_id
      t.timestamps
    end
    
    create_table :page_categories, :force => true do |t|
      t.string :name
      t.timestamps
    end
  end
end
