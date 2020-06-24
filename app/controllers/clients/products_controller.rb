# frozen_string_literal: true

class Clients::ProductsController < ApplicationController
  # before_action :authenticate_client!, only: [:show, :index]
  def index
    if params[:genre_id]
      @genres = Genre.all
      genre = Genre.find(params[:genre_id])
      @genre = genre.name
      @products = Product.page(params[:page]).reverse_order
    else
      @genres = Genre.all
      @genre = '商品一覧'
      @products = Product.page(params[:page]).reverse_order
    end
  end

  def show
    @product = Product.find(params[:id])
    @inside_cart = InsideCart.new
  end

  def top
    @genres = Genre.all
    render action: :_genre_serch_form
  end

  def genre_products; end

  private

  def product_params
    params.require(:product).permit(:product_id, :name, :price, :explanation, :image_id, :is_enabled, :genre_id)
  end
end
