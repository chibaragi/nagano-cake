class Order < ApplicationRecord
	has_many :product_orders, dependent: :destroy
	belongs_to :client

	enum order_status:{
    credit_card: 0, #クレジットカード
		bank_transfer: 1 #銀行振込
  }
end
