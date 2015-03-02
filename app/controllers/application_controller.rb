class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_categories_for_sidebar
  before_action :set_current_cart
  before_action :set_sale_items
  respond_to :html

  private
  def set_categories_for_sidebar
    @sidebar_categories = Category.all
  end

  def set_current_cart
    @current_cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end

  def set_sale_items
    @sale_items = Good.sale
  end
end
