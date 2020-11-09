class EventOrder < ActiveRecord::Migration[4.2]
  def self.up
    add_column :events, :position, :integer
  end

  def self.down
    remove_column :events, :position
  end
end
