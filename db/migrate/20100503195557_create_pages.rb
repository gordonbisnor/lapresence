# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[4.2]
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
