# frozen_string_literal: true

class SpotsAvailable < ActiveRecord::Migration[4.2]
  def self.up
    add_column :events, :available_spots, :string
  end

  def self.down
    remove_column :events, :available_spots
  end
end
