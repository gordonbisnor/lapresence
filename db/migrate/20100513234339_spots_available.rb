class SpotsAvailable < ActiveRecord::Migration
  def self.up
    add_column :events, :available_spots, :string
  end

  def self.down
    remove_column :events, :available_spots
  end
end
