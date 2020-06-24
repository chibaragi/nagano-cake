class Clients::OrdersController < ApplicationController
  before_action :authenticate_client!
  def new
    @order = Order.new
    @client = Client.find(current_client.id)
    @shipping_addresses = @client.shipping_addresses

    # デモ
    if params[:client_address]
      @demo = "ご自身の住所を選びました"
    elsif params[:create_address]
      @demo = "新しいお届け先を選びました"
    elsif params[:registrated_address]
      @demo = "登録済住所から選択"
    else
      @demo = "選択してください"
    end
  end

  def pre_create
    @order = Order.new(order_params)
    @order.client_id = current_client.id
    @order.postage = 800
    # 下記はデモでいれてみる
    @order.order_status = 0
    @order.total_price = 1000
    if @order.save
      # flash[:create] = ""
      redirect_to orders_confirm_order_path
    else
      # flash.now[:alert_precreate] = ""
      redirect_back(fallback_location: root_path)
    end
  end

  def confirm_order
  end

  def create
  end

  def after_order
  end

  def index
  end

  def show
  end
end

private
def order_params
  params.require(:order).permit(:payment, :receive_name, :postal_code, :street_address)
end
