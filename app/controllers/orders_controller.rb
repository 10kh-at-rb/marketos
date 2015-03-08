class OrdersController < ApplicationController

  load_and_authorize_resource

  def show
    respond_with @order
  end

  def new
    @order = current_user ? current_user.orders.new(name: current_user.name, email: current_user.email, phone: current_user.phone, address: current_user.address) : Order.new
    respond_with @order
  end

  def create
    @order = current_user ? current_user.orders.create(order_params) : Order.create(order_params)
    if @order.save
      @order.add_items_from_cart(@current_cart)
      @current_cart.destroy
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :email, :address, :payment_type)
  end
end
