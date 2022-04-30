# frozen_string_literal: true

class AddTotalPriceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :totalprice, :decimal
  end
end
