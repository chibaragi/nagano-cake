class Clients::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @inside_cart = InsideCart.new
  end

  def top
    @products = Product.order("RANDOM()").limit(6)
  end

  # ここ消したい（飯田）
  # def genre_products
  # end

  def _genre_serch_form
    @genres = Genre.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :image_id, :is_enabled, :genre_id)
  end
end
