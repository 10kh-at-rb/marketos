class CartsController < ApplicationController

  def show
    respond_with(@current_cart)
  end

end