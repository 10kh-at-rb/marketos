class CartsController < ApplicationController
  authorize_resource

  def show
    respond_with(@current_cart)
  end

  def destroy
    session[:cart_id] = nil
    @current_cart.destroy
    redirect_to cart_path
  end

end