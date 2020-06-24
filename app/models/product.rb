# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :genre
  has_many :inside_carts, dependent: :destroy
  has_many :clients, through: :inside_carts
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  attachment :image
end
