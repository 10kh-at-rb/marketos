class GoodsController < ApplicationController

  add_breadcrumb I18n::t(:categories), :categories_path
  respond_to :js
  load_and_authorize_resource
  def index
    respond_with @goods = Good.all
  end

  def show
    add_breadcrumb @good.category.title, category_path(@good.category)
    add_breadcrumb @good.name, category_good_path(@good.category, @good)
    respond_with @good
  end

  def add_to_cart
    @current_cart.add_good(@good)
  end

end
