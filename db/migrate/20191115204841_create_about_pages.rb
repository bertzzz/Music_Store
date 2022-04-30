# frozen_string_literal: true

class CreateAboutPages < ActiveRecord::Migration[6.0]
  def change
    create_table :about_pages do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
