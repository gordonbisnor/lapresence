class MakeEventsMorePaperclippy < ActiveRecord::Migration[4.2]
  def self.up
    rename_column :events, :picture_file_type, :picture_content_type
  end

  def self.down
    rename_column :events, :picture_content_type, :picture_file_type
  end
end
