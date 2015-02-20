class Admin::CategoriesController < Admin::AdminController
  load_and_authorize_resource

  def index
    respond_with @categories
  end

  def new
    respond_with @category
  end

  def create
    respond_with(@category = Category.create(category_params), location: admin_path)
  end

  private

  def category_params
    params.require(:category).permit(:title, :description, :picture)
  end

end