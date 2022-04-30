# frozen_string_literal: true

class AboutPage < ApplicationRecord
  validates :title, :content, presence: true
  validates :content, length: { maximum: 1000, too_long: '%{count} characters is the maximum allowed. ' }
end
