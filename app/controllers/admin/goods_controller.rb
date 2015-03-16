class Admin::GoodsController < Admin::AdminController
  load_and_authorize_resource

  def show
    respond_with @good
  end

  def new
    @categories = Category.all
    respond_with @good
  end

  def create
    respond_with(@good = Good.create(good_params), location: admin_path)
  end

  def edit
    @categories = Category.all
    respond_with @good
  end

  def update
    @good.update(good_params)
    respond_with(@good, location: admin_category_path(@good.category))
  end

  private
  def good_params
    params.require(:good).permit(:name, :description, :price, :category_id, :sale, photos_attributes: [:id, :file, :_destroy])
  end
end