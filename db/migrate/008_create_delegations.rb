class CreateDelegations < ActiveRecord::Migration
  def self.up
    create_table :delegations do |t|
    end
  end

  def self.down
    drop_table :delegations
  end
end
