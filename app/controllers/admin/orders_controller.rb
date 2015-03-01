class Admin::OrdersController < Admin::AdminController
  load_and_authorize_resource
  respond_to :js

  def change_status
    @order.change_status
    respond_with @order
  end
end