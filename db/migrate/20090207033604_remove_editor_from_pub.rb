class RemoveEditorFromPub < ActiveRecord::Migration
  def self.up
    remove_column "publications", "editor_id"
  end

  def self.down
    add_column "publications", "editor_id", :integer
  end
end
