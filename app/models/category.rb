# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :instruments

  validates :name, presence: true
end
