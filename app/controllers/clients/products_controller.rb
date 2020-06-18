class Clients::ProductsController < ApplicationController
  def index
  end

  def show
  end

  def top
  end

  def genre_products
  end

  def _genre_serch_form
  	@genres = Genre.all
  end
end
