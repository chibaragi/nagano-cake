class Clients::ProductsController < ApplicationController
<<<<<<< HEAD
  def index
    @products = Product.page(params[:page]).reverse_order
  end
=======
>>>>>>> develop

  def show
  	product = Product.find(params[:id])
  end

  def top

  end

  def genre_products
  end

  private

  def product_params
  	params.require(:product).permit(:product_id, :name, :price, :explanation, :image_id, :is_enabled, :genre_id)
  end
end
