class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum order_status:{
    "着手不可" => 0,  
		"製作待ち" => 1, 
		"制作中" => 2,  
		"製作完了" => 3
  }
  # 製作ステータスが一つでも「製作中」になったら注文ステータスが「製作中」に自動更新
  def product_order_status_is_in_production?
    if self.product_order_status_before_type_cast == 2
      self.order.update(order_status: 2)
    end
  end
end
