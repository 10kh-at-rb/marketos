class GoodsController < ApplicationController

  add_breadcrumb "Catalog", :categories_path
  respond_to :js
  load_and_authorize_resource
  def index
    respond_with @goods = Good.all
  end

  def show
    add_breadcrumb @good.category.title, category_path(@good.category)
    add_breadcrumb @good.name, good_path(@good)
    respond_with @good
  end

  def add_to_cart
    @current_cart.add_good(@good)
  end

end
