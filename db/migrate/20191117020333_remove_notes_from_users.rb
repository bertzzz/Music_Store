# frozen_string_literal: true

class RemoveNotesFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :notes, :string
  end
end
