# frozen_string_literal: true

class AddSatAndSunToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :sathrs, :string
    add_column :contacts, :sunhrs, :string
  end
end
