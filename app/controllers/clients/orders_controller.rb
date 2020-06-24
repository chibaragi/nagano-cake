# frozen_string_literal: true

class Clients::OrdersController < ApplicationController
  before_action :authenticate_client!

  def new
    @order = Order.new
    @orders = current_client.orders.all
    @client = Client.find(current_client.id)
    @shipping_addresses = @client.shipping_addresses
  end

  def pre_create
    @client = Client.find(current_client.id)
    if params[:selected_address] == "radio1"
      session[:payment] = order_params[:payment]
      session[:postal_code] = @client.postal_code
      session[:street_address] = @client.street_address
      session[:receive_name] = @client.first_name + @client.last_name

      redirect_to orders_confirm_order_path
    elsif params[:selected_address] == "radio2"
      session[:payment] = order_params[:payment]
      if params[:regestrated_address][:regestrated_address] == ""
        flash[:danger] = "登録済み住所を選択してください"
        redirect_back(fallback_location: root_path)
      else
        @selected_shipping_address = @client.shipping_addresses.find(params[:regestrated_address][:regestrated_address])
        session[:postal_code] = @selected_shipping_address.postal_code
        session[:street_address] = @selected_shipping_address.street_address
        session[:receive_name] = @selected_shipping_address.receive_name
        redirect_to orders_confirm_order_path
      end
    elsif params[:selected_address] == "radio3"
      session[:payment] = order_params[:payment]
      session[:postal_code] = order_params[:postal_code]
      session[:street_address] = order_params[:street_address]
      session[:receive_name] = order_params[:receive_name]
      # shipping_addressesのインスタンス（外部キーにclient＿idが入ってる）を作成
      @shipping_address = @client.shipping_addresses.build
      # shipping_addressesテーブルに保存
      @shipping_address.postal_code = order_params[:postal_code]
      @shipping_address.street_address = order_params[:street_address]
      @shipping_address.receive_name = order_params[:receive_name]
      if @shipping_address.save
        flash[:success] = "新しいお届け先が保存されました"
        redirect_to orders_confirm_order_path
      else
        flash[:danger] = "新しいお届け先の情報を正しく入力してください"
        render :new
      end
    else # どのラジオボタンも選択されていないときは同じページに返す
      flash[:danger] = "必要情報を入力してください"
      redirect_back(fallback_location: root_path)
    end
  end


  def confirm_order
    @inside_carts = current_client.inside_carts.all
    @order = Order.new(
      payment: session[:payment].to_i,
      receive_name: session[:receive_name],
      postal_code: session[:postal_code],
      street_address: session[:street_address],
      postage: 800
    )
    @sum = 0
    @subtotals = @inside_carts.map { |inside_cart| (Product.find(inside_cart.product_id).price * 1.1 * inside_cart.quantity).to_i }
    @sum = @subtotals.sum
    session[:sum] = @sum
  end

  def create
    @order = Order.new(
      payment: session[:payment].to_i,
      receive_name: session[:receive_name],
      postal_code: session[:postal_code],
      street_address: session[:street_address],
      postage: 800,
      order_status: 0,
      client_id: current_client.id
    )
    @order.total_price = session[:sum] + @order.postage
    if @order.client.inside_carts.count >= 1
      @order.save
      # 注文商品テーブルに代入
      @order.client.inside_carts.each do |i|
        @product_order = @order.product_orders.build
        @product_order.order_id = @order.id
        @product_order.product_order_status = 0
        @product_order.product_id = i.product_id
        @product_order.quantity = (i.quantity * 1.1).to_i
        @product_order.once_price = (i.product.price * 1.1).to_i
        @product_order.save
      end
      # カートを空に
      @order.client.inside_carts.destroy_all
      # セッション削除
      session[:payment].clear
      session[:receive_name].clear
      session[:postal_code].clear
      session[:street_address].clear
      session.delete(:sum)
      redirect_to orders_after_order_path
    else
      flash[:danger] = "注文確定に失敗しました.   カートが空でないか確認してください"
      redirect_back(fallback_location: root_path)
    end
  end

  def after_order; end


  def index
    @orders = current_client.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @product_orders = @order.product_orders.all
    # 下記３行は商品合計を出すため
    @sum = 0
    @subtotals = @product_orders.map { |product_order| product_order.once_price * product_order.quantity }
    @sum = @subtotals.sum
  end


  private
  def order_params
    params.require(:order).permit(:payment, :receive_name, :postal_code, :street_address)
  end

end
