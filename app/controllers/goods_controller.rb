class GoodsController < ApplicationController

  add_breadcrumb "Catalog", :categories_path
  respond_to :js
  def index
    respond_with @goods = Good.all
  end

  def show
    @good = Good.find(params[:id])
    add_breadcrumb @good.category.title, category_path(@good.category)
    add_breadcrumb @good.name, good_path(@good)
    respond_with @good
  end

  def add_to_cart
    @good = Good.find(params[:id])
    @current_cart.add_good(@good)
  end

end
