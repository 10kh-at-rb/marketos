class Admin::DashboardController < Admin::AdminController
  
  def index
    respond_with(@orders = Order.all)
  end
end
