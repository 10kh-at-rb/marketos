class CategoriesController < ApplicationController
  add_breadcrumb "Catalog", :categories_path, only: %w(index show)

  def index
    respond_with @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.title, category_path(@category)
    respond_with @category
  end

end
