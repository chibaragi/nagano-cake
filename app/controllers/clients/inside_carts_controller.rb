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
    @inside_carts=current_client.inside_carts.all
  end

  def update
    @inside_cart=InsideCartfind
    (insidecarts_params)
    # ここはやってない
  end

  def destroy
    @inside_cart = InsideCart.find(params[:id])
    @inside_cart.destroy
    redirect_to inside_carts_path
  end

  def destroy_all
  end

  private

  def inside_carts_params
    params.require(:inside_cart).permit(:quantity)
  end

end
