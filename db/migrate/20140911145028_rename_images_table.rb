# frozen_string_literal: true

class RenameImagesTable < ActiveRecord::Migration[4.2]
  def change
    rename_table :images, :attachments
  end
end
