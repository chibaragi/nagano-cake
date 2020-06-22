class Admins::OrdersController < ApplicationController
  def top
    # （todo)反映されない＋時間ずれる
    @today_orders=Order.where(created_at: Date.today)
  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @product_orders = @order.product_orders.all
    # 下記３行は商品合計を出すため
    @sum  = 0
    @subtotals = @product_orders.map {|product_order|  product_order.once_price * product_order.quantity  } 
    @sum = @subtotals.sum
  end

  def order_status_update
    @order = Order.find(params[:order][:id])
    if @order.update(params_int(order_params))
      # (todo)flash[:book_update] = ""
      # 注文ステータスが「入金確認」になったら紐づく製作ステータス全てを「製作待ち」に自動更新(モデルに定義)
      @order.order_status_is_deposited?
      redirect_back(fallback_location: root_path)
    else
      #  (todo)flash[:book_update] = ""
      redirect_back(fallback_location: root_path)
    end
  end

  def product_orders_status_update
    @product_order = ProductOrder.find(params[:product_order][:id])
    if @product_order.update(params_int(product_order_params))
      # (todo)flash[:book_update] = ""
      # 製作ステータスが一つでも「製作中」になったら注文ステータスが「製作中」に自動更新（モデルに定義）
      @product_order.product_order_status_is_in_production?
      # 製作ステータスが全部「製作完了」になったら注文ステータスが「発送準備中」に自動更新（モデルに定義）
      @order = Order.find_by(id:params[:product_order][:order_id])
      @order.product_order_status_is_production_complete?
      redirect_back(fallback_location: root_path)
    else
      #  (todo)flash[:book_update] = ""
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

  def product_order_params
    params.require(:product_order).permit(:product_order_status,:id)
  end

  # 以下２つは、update時、formから送られてくる値がデフォルトでstringなのでintegerに変換するためのもの。まずはそもそも整数にできるか調べる（Integer()で変換できれば数値、例外発生したら違う）
  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end
  
  def params_int(order_params)
    order_params.each do |key,value|
      if integer_string?(value)
        order_params[key]=value.to_i
      end
    end
  end
end
