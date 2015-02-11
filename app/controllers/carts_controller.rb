class CartsController < ApplicationController

  def show
    respond_with(@current_cart)
  end

  def destroy
    @current_cart.destroy
    redirect_to cart_path
  end

end