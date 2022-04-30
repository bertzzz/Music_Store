# frozen_string_literal: true

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Users.destroy_all
# LineItem.destroy_all
# Cart.destroy_all
# Instrument.destroy_all
# Category.destroy_all

# Instrument.create!([{
#   title: "Paul Reed Smith Paul's Guitar 2013",
#   brand: "PRS",
#   model: "Paul Reed Smith Paul's Guitar",
#   description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
#   condition: "Excellent",
#   finish: "Red",
#   price: "2999",
#   image: Rails.root.join("app/assets/images/instrument1.jpg").open,
#   user_id: user.id
# }])
