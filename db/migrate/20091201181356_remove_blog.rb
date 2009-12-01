class RemoveBlog < ActiveRecord::Migration
  def self.up
    drop_table :blog_post_categories
    drop_table :blog_posts
    drop_table :categories
    
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Table shouldn't have existed in the first place"
  end
end
