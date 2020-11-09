class CreateEvents < ActiveRecord::Migration[4.2]
  def self.up
    create_table :events do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :schedule
      t.string :cost
      t.string :event_type
      t.text :content
      t.text :notes
      t.string :picture_file_name
      t.string :picture_file_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
