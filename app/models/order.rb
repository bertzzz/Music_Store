# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  validates :totalprice, presence: true
end
