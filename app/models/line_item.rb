# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :instrument
  belongs_to :cart

  after_update :check_qty

  def total_price
    instrument.price * quantity
  end

  private

  def check_qty
    destroy if quantity.zero?
  end
end
