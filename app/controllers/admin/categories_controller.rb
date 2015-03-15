class Admin::CategoriesController < Admin::AdminController
  load_and_authorize_resource

  def index
    respond_with @categories = Category.root.includes(:child_categories)
  end

  def new
    respond_with @category
  end

  def show
    respond_with @category
  end

  def create
    respond_with(@category = Category.create(category_params), location:  admin_categories_path )
  end

  def edit
    respond_with @category
  end

  def update
    @category.update(category_params)
    respond_with(@category, location:  admin_categories_path)
  end

  private

  def category_params
    params.require(:category).permit(:title, :description, :picture, :parent_id)
  end

end