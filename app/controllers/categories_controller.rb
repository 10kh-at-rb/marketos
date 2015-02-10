class CategoriesController < ApplicationController

  def index
    respond_with @categories = Category.all
  end

  def show
    respond_with @category = Category.find(params[:id])
  end

end
