class Admin::DashboardController < Admin::AdminController
  
  def index
    respond_with(@orders = Order.all.includes(:cart_items))
  end
end
