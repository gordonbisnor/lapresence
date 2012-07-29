class VestalUpdate < ActiveRecord::Migration
  def change
    rename_column :versions, :changes, :modifications
    add_column :versions, :reverted_from, :integer
  end
end