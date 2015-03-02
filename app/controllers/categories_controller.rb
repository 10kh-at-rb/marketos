class CategoriesController < ApplicationController
  add_breadcrumb I18n::t(:categories), :categories_path, only: %w(index show)
  load_and_authorize_resource
  def index
    respond_with @categories = Category.all
  end

  def show
    add_breadcrumb @category.title, category_path(@category)
    @goods = @category.goods.paginate(page: params[:page])
    respond_with @category
  end

end
