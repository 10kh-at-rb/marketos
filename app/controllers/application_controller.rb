class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_categories_for_sidebar
  respond_to :html

  private
  def set_categories_for_sidebar
    @sidebar_categories = Category.all
  end
end
