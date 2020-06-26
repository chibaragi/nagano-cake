# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :genre
  has_many :inside_carts, dependent: :destroy
  has_many :clients, through: :inside_carts
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  attachment :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre_id, presence: true
  # 値段設定時、半角数字のみ登録可能にするバリデーション
  validates :price, presence: true, format: {
    with: /\A[0-9]+\z/,
    message: "価格は半角数字で入力してください",
  }

  #  ここから追加（飯田）
  # 検索機能（部分検索）
  def self.search(word)
    Product.where("name LIKE?", "%#{word}%")
  end
  # ここまで
end
