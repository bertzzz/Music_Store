# frozen_string_literal: true

class Instrument < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  has_many :line_items
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  mount_uploader :image, ImageUploader
  serialize :image, JSON

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 3000, too_long: '%{count} characters is the maximum allowed. ' }
  validates :title, length: { maximum: 140, too_long: '%{count} characters is the maximum aloud. ' }
  validates :price, numericality: true, length: { maximum: 7 }

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
