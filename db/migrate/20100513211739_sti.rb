class Sti < ActiveRecord::Migration[4.2]
  def self.up
    rename_column :events, :event_type, :type
  end

  def self.down
    rename_column :events, :type, :event_type
  end
end
