# class SearchesController < ApplicationController
class Admins::SearchesController < ApplicationController
  def search
    @range = params[:range]
    # search = params[:search]
    @word = params[:word]
    # 論理削除済の顧客を含めてsearchするために.with_deletedを追記しました。byけんちゃん
    if @range == '1'
      @clients = Client.with_deleted.search(@word)
    elsif @range == '2'
      @products = Product.search(@word)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
