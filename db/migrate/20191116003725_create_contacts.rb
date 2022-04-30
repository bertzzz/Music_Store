# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :telephone
      t.string :street
      t.string :postal
      t.string :province
      t.string :hrsmon
      t.string :hrstue
      t.string :hrswed
      t.string :hrsthr
      t.string :hrsfri

      t.timestamps
    end
  end
end
