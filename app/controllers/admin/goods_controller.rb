class Admin::GoodsController < Admin::AdminController
  load_and_authorize_resource

  def new
    @categories = Category.all
    respond_with @good
  end

  def create
    respond_with(@good = Good.create(good_params), location: admin_path)
  end

  private
  def good_params
    params.require(:good).permit(:name, :description, :price, :category_id, photos_attributes: [:id, :file])
  end
end