# frozen_string_literal: true

class AddSeoFields < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :seo_image, :string
    add_column :pages, :seo_description, :string
  end
end
