# frozen_string_literal: true

class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :postal, :string
  end
end
