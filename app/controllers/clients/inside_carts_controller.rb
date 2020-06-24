# frozen_string_literal: true

class Clients::InsideCartsController < ApplicationController
  def create
    @inside_carts = current_client.inside_carts.all
    if  @inside_carts.any? { | inside_cart | inside_cart.product_id == params[:inside_cart][:id].to_i }
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
  end
  def index
    @inside_carts = current_client.inside_carts.all
    @sum = 0
    @inside_carts.each do |inside_cart|
      @subtotal = (Product.find(inside_cart.product_id).price * 1.1 * inside_cart.quantity).to_i
      @sum += @subtotal
    end
  end

  def update
    # @inside_carts = InsideCart.find(inside_carts_params[:quantity])
    # @inside_carts.update
    # redirect_to inside_carts_path
    @inside_cart = InsideCart.find(params[:id])
    @inside_cart.quantity = params[:inside_cart][:id]
    @inside_cart.update(inside_carts_params)
    flash[:success] = '個数を変更しました'
    # byebug
    redirect_back(fallback_location: root_path)
  end

  def destroy
    inside_carts = InsideCart.find_by(id: params[:id], client_id: current_client.id)
    inside_carts.destroy

    redirect_to inside_carts_path
  end

  def destroy_all
    current_client.inside_carts.destroy_all
    redirect_to inside_carts_path
  end

  def create
    @inside_carts = current_client.inside_carts.all
    if @inside_carts.any? { |inside_cart| inside_cart.product_id == params[:inside_cart][:id].to_i }
      @inside_cart_already = InsideCart.find_by(product_id: params[:inside_cart][:id].to_i)
      @inside_cart_already.quantity += params[:inside_cart][:quantity].to_i
      @inside_cart_already.save
      flash[:success] = 'カートに商品を入れました'
      redirect_to inside_carts_path
    else
      @inside_cart = InsideCart.new(
        quantity: params[:inside_cart][:quantity].to_i,
        product_id: params[:inside_cart][:id].to_i,
        client_id: current_client.id
      )
      @inside_cart.save
      flash[:success] = 'カートに商品を入れました'
      redirect_to inside_carts_path
    end
  end

  private

  def inside_carts_params
    params.require(:inside_cart).permit(:quantity, :product_id)

  end

end
