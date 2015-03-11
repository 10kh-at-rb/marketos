class SearchController < ApplicationController

  def find
    @goods = Good.search params[:search], group_by: :category_id
    render 'goods/search_result'
  end

end