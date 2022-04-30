# frozen_string_literal: true

ActiveAdmin.register Instrument do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :brand, :model, :description, :condition, :finish, :title, :price, :user_id, :image, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:brand, :model, :description, :condition, :finish, :title, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
