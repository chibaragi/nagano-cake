class Clients::OrdersController < ApplicationController
   before_action :authenticate_client!

  def new
    @order=Order.new
    @orders=current_client.orders.all
    @client=Client.find(current_client.id)
    @shipping_addresses=@client.shipping_addresses
  end

  def pre_create
    @client=Client.find(current_client.id)
    # shipping_addressesのインスタンス（外部キーにclient＿idが入ってる）を作成
    @shipping_address=@client.shipping_addresses.build  
    if params[:selected_address] == "radio1"
      session[:payment] = params[:order][:payment]
      session[:postal_code] = @client.postal_code
      session[:street_address] = @client.street_address
      session[:receive_name] = @client.first_name + @client.last_name
      redirect_to orders_confirm_order_path
    elsif params[:selected_address] == "radio2"
      session[:payment] = params[:order][:payment]
      session[:postal_code] = params[:order][:postal_code]
      session[:street_address] = params[:order][:street_address]
      session[:receive_name] = params[:order][:receive_name]
      redirect_to orders_confirm_order_path
    elsif params[:selected_address] == "radio3"
      session[:payment] = params[:order][:payment]
      session[:postal_code] = params[:order][:postal_code]
      session[:street_address] = params[:order][:street_address]
      session[:receive_name] = params[:order][:receive_name]
      # shipping_addressesテーブルに保存
      @shipping_address.postal_code=params[:order][:postal_code]
      @shipping_address.street_address=params[:order][:street_address]
      @shipping_address.receive_name=params[:order][:receive_name]
      @shipping_address.save
      # バリデーションかフラッシュメッセージ書く／正規表現
      redirect_to orders_confirm_order_path
    else #どのラジオボタンも選択されていないときは同じページに返す
      # バリデーションかフラッシュメッセージ書く
      redirect_back(fallback_location: root_path)
    end
  end

  def confirm_order
  end

  def create
    @order=Order.new(
      payment: session[:payment], 
      receive_name: session[:receive_name],
      postal_code: session[:postal_code],
      street_address: session[:street_address],
      postage:800,
      order_status:0,
      client_id:current_client.id
    ) 
    @order.total_price=1000

    if @order.save
      # セッション削除 .clear
      # 注文商品テーブルに代入
      # カートをからに
      redirect_to orders_after_order_path

    else
      redirect_back(fallback_location: root_path)
    end


     # @order=Order.new(order_params)
    # if @order.save
      # flash[:create] = ""
    #   redirect_to orders_confirm_order_path
    # else
      # flash.now[:alert_precreate] = ""
    #   redirect_back(fallback_location: root_path)
    # end
  end

  def after_order
  end

  def index
  end

  def show
  end

  # private
  # def order_params
  #   params.require(:order).permit(:payment, :receive_name, :postal_code,:street_address)
  # end
end