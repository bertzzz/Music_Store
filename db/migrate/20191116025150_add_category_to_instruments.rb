# frozen_string_literal: true

class AddCategoryToInstruments < ActiveRecord::Migration[6.0]
  def change
    add_reference :instruments, :category, foreign_key: true
  end
end
