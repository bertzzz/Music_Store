# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_117_034_036) do
  create_table 'about_pages', force: :cascade do |t|
    t.string 'title'
    t.string 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.integer 'resource_id'
    t.string 'author_type'
    t.integer 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'contacts', force: :cascade do |t|
    t.string 'name'
    t.string 'telephone'
    t.string 'street'
    t.string 'postal'
    t.string 'province'
    t.string 'hrsmon'
    t.string 'hrstue'
    t.string 'hrswed'
    t.string 'hrsthr'
    t.string 'hrsfri'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'sathrs'
    t.string 'sunhrs'
  end

  create_table 'instruments', force: :cascade do |t|
    t.string 'brand'
    t.string 'model'
    t.text 'description'
    t.string 'condition'
    t.string 'finish'
    t.string 'title'
    t.decimal 'price', precision: 5, scale: 2, default: '0.0'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'image'
    t.integer 'user_id'
    t.integer 'category_id'
    t.index ['category_id'], name: 'index_instruments_on_category_id'
  end

  create_table 'line_items', force: :cascade do |t|
    t.integer 'instrument_id', null: false
    t.integer 'cart_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'quantity', default: 1
    t.index ['cart_id'], name: 'index_line_items_on_cart_id'
    t.index ['instrument_id'], name: 'index_line_items_on_instrument_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'status'
    t.integer 'cart_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.decimal 'totalprice'
    t.index ['cart_id'], name: 'index_orders_on_cart_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.string 'street'
    t.string 'city'
    t.string 'province'
    t.string 'postal'
    t.text 'notes'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'instruments', 'categories'
  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'line_items', 'instruments'
  add_foreign_key 'orders', 'carts'
end
