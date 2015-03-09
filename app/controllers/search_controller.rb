class SearchController < ApplicationController

  def find
    @goods = Good.search(params[:search])
    render 'goods/search_result'
  end

end