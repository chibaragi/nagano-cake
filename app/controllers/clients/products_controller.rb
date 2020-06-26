class Clients::ProductsController < ApplicationController
  # このページ全体的に変更（飯田）←にしくんが同じ変更してたら不要！！！！
  # ジャンルが有効かつ商品も販売中の商品のshowとupdateできないようにする
  before_action :ensure_enabled_product, only: [:show, :update]
  def index
    @genres = Genre.where(is_enabled: true)
    if params[:genre_id].nil?
      # ジャンルが有効かつ商品も販売中の商品のみ表示させる
      @products = Product.joins(:genre).where(genres: { is_enabled: true }).where(is_enabled: true).page(params[:page]).reverse_order
    else
      @products = Product.joins(:genre).where(genres: { is_enabled: true, id: params[:genre_id] }).where(is_enabled: true).page(params[:page]).reverse_order
    end
  end

  def show
    @product = Product.find(params[:id])
    @inside_cart = InsideCart.new
    @genres = Genre.where(is_enabled: true)
  end

  def top
    @products = Product.joins(:genre).where(genres: { is_enabled: true }).where(is_enabled: true).order("RANDOM()").limit(6)
    @genres = Genre.where(is_enabled: true)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :image_id, :is_enabled, :genre_id)
  end

  def ensure_enabled_product
    products = Product.joins(:genre).where(genres: { is_enabled: true }).where(is_enabled: true)
    unless products.any? { |p| p == Product.find(params[:id]) }
      redirect_back(fallback_location: root_path)
    end
  end
end
