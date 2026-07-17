# frozen_string_literal: true

class AddImageDataToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :image_data, :text
  end
end
