class Order < ApplicationRecord
	has_many :product_orders, dependent: :destroy
	belongs_to :client

	# enum payment:{
  #   "クレジットカード" => 0, 
	# 	"銀行振込" => 1    
	# }
	# enum order_status:{
  #   "入金待ち" => 0,  
	# 	"入金確認" => 1,  
	# 	"制作中" => 2, 
	# 	"発送準備中" => 3,  
	# 	"発送済み" => 4   
	# }
	
	# enum payment:{
  #   :credit_card => 0,  #クレジットカード
	# 	:bank_transfer => 1    #銀行振込
	# }
	# enum order_status:{
  #   :before_deposit => 0,  #入金待ち
	# 	:deposited => 1,  #入金確認
	# 	:in_production => 2,  #制作中
	# 	:preparing_delivery => 3,  #発送準備中
	# 	:delivered => 4   #発送済み
	# }

	# 注文ステータスが「入金確認」になったら紐づく製作ステータス全てを「製作待ち」に自動更新
	def order_status_is_deposited?
		if self.order_status_before_type_cast == 1
			self.product_orders.each do |p|
				p.update(product_order_status:1)
			end
		end
	end
	# 製作ステータスが全部「製作完了」になったら注文ステータスを「発送準備中」に自動更新
  def product_order_status_is_production_complete?
    if  self.product_orders.all? { |p|
      p.product_order_status_before_type_cast == 3 }
      self.update(order_status: 3)
    end
  end
end
