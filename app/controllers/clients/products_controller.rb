class Clients::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @inside_cart=InsideCart.new
  end

  def top
    @genres = Genre.all
    @products = Product.all
  end

  def genre_products
  end

  private

  def product_params
    params.require(:product).permit(:product_id, :name, :price, :explanation, :image_id, :is_enabled, :genre_id)
  end
end
