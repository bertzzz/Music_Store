# frozen_string_literal: true

ActiveAdmin.register AboutPage do
  permit_params :title, :content
end
