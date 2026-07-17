# frozen_string_literal: true

class AddShrineDataToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :shrine_data, :text
  end
end
