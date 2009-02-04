class CreateEventPages < ActiveRecord::Migration
  def self.up
    create_table :event_pages do |t|
    end
  end

  def self.down
    drop_table :event_pages
  end
end
