class Product < ApplicationRecord
  belongs_to :genre
  has_many :inside_carts, dependent: :destroy
  has_many :clients, through: :inside_carts
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  attachment :image

#  ここから追加（飯田）
  # 検索機能（部分検索）
  def self.search(word)
      Product.where("name LIKE?", "%#{word}%")
  end
  # ここまで
end
