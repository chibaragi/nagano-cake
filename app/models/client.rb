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
end
