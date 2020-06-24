class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  has_many :shipping_addresses, dependent: :destroy
  has_many :inside_carts, dependent: :destroy
  has_many :products, through: :inside_carts
  has_many :orders, dependent: :destroy

  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  # アカウント作成時の電話番号はハイフンなしの10桁もしくは11桁のみ登録可能とするバリデーション
  validates :first_name_kana, :last_name_kana, presence: true,
                                               format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  # アカウント作成時の苗字名前のカナ入力欄のカタカナのみ入力可能とするバリデーション
  validates :postal_code, format: { with: /\A\d{7}\z/ }
  # アカウント作成時の郵便番号はハイフンなしの7桁のみ登録可能とするバリデーション
end
