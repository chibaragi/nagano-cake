class Clients::InsideCartsController < ApplicationController
  # ここ以下変更（飯田）←かんちゃんが同じ変更してたら不要
  before_action :authenticate_client!
  def create
    @inside_carts = current_client.inside_carts.all
    if  inside_carts_params[:quantity] != ""
      if @inside_carts.any? { |inside_cart| inside_cart.product_id == params[:inside_cart][:id].to_i }
        @inside_cart_already = InsideCart.find_by(product_id: params[:inside_cart][:id].to_i)
        @inside_cart_already.quantity += params[:inside_cart][:quantity].to_i
        @inside_cart_already.save
        flash[:success] = "カートに商品を入れました"
        redirect_to inside_carts_path
      else
        @inside_cart = InsideCart.new(
          quantity: params[:inside_cart][:quantity].to_i,
          product_id: params[:inside_cart][:id].to_i,
          client_id: current_client.id
        )
        @inside_cart.save
        flash[:success] = "カートに商品を入れました"
        redirect_to inside_carts_path
      end
    else
      flash[:danger] = "個数を入力してください"
      redirect_back(fallback_location: root_path)
    end
  end

  # ここまで（飯田）
  def index
    @inside_carts = current_client.inside_carts.all
    @sum = 0
    @inside_carts.each do |inside_cart|
      @subtotal = (Product.find(inside_cart.product_id).price * 1.1 * inside_cart.quantity).to_i
      @sum += @subtotal
    end
  end

  def update
    @inside_cart = InsideCart.find(params[:id])
    @inside_cart.quantity = params[:inside_cart][:id]
    @inside_cart.update(inside_carts_params)
    flash[:success] = '個数を変更しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    inside_carts = InsideCart.find_by(id: params[:id], client_id: current_client.id)
    inside_carts.destroy
    flash[:danger] = "カートから削除しました"
    redirect_to inside_carts_path
  end

  def destroy_all
    current_client.inside_carts.destroy_all
    redirect_to inside_carts_path
  end

  private

  def inside_carts_params
    params.require(:inside_cart).permit(:quantity, :product_id)
  end
end
