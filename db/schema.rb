# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_16_072248) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'first_name_kana', null: false
    t.string 'last_name_kana', null: false
    t.string 'phone_number', null: false
    t.string 'postal_code', null: false
    t.string 'street_address', null: false
    t.datetime 'deleted_at'
    t.index ['email'], name: 'index_clients_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_clients_on_reset_password_token', unique: true
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name', null: false
    t.boolean 'is_enabled', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'inside_carts', force: :cascade do |t|
    t.integer 'client_id'
    t.integer 'product_id'
    t.integer 'quantity', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_inside_carts_on_client_id'
    t.index ['product_id'], name: 'index_inside_carts_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'client_id', null: false
    t.string 'receive_name', null: false
    t.string 'postal_code', null: false
    t.string 'street_address', null: false
    t.integer 'postage', default: 800, null: false
    t.integer 'payment', default: 0, null: false
    t.integer 'total_price', null: false
    t.integer 'order_status', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_orders_on_client_id'
  end

  create_table 'product_orders', force: :cascade do |t|
    t.integer 'order_id'
    t.integer 'product_id'
    t.integer 'quantity', null: false
    t.integer 'once_price', null: false
    t.integer 'product_order_status', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_product_orders_on_order_id'
    t.index ['product_id'], name: 'index_product_orders_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.integer 'genre_id'
    t.string 'name', null: false
    t.integer 'price', null: false
    t.text 'explanation', null: false
    t.string 'image_id', null: false
    t.boolean 'is_enabled', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['genre_id'], name: 'index_products_on_genre_id'
  end

  create_table 'shipping_addresses', force: :cascade do |t|
    t.integer 'client_id'
    t.string 'receive_name', null: false
    t.string 'postal_code', null: false
    t.string 'street_address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_shipping_addresses_on_client_id'
  end
end
