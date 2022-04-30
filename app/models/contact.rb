# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, :telephone, :street, :postal, :province, :hrsmon, :hrstue,
            :hrswed, :hrsthr, :hrsfri, :sathrs, :sunhrs, presence: true
end
