class AddPublishedToAteliers < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :published, :boolean
  end
end
