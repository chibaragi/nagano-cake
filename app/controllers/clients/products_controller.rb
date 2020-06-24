class Clients::ProductsController < ApplicationController
  # before_action :authenticate_client!, only: [:show, :index]
  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    product = Product.find(params[:id])
  end

  def top
  end

  def genre_products
  end

  def _genre_serch_form
    @genres = Genre.all
  end

  private

  def product_params
    params.require(:product).permit(:product_id, :name, :price, :explanation, :image_id, :is_enabled, :genre_id)
  end
end
