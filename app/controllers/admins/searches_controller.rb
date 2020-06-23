# class SearchesController < ApplicationController
class Admins::SearchesController < ApplicationController
  def search
    @range = params[:range]
    # search = params[:search]
    @word = params[:word]

    if @range == '1'
      @clients = Client.search(@word)
    elsif @range == '2'
      @products = Product.search(@word)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
