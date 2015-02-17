class CartItemsController < ApplicationController

  # before_action :set_cart_item
  respond_to :js
  load_and_authorize_resource
  def destroy
    @cart_item.destroy
    redirect_to '/cart'
  end

  def increase
    @cart_item.change_quantity(1)
    render 'change'
  end

  def decrease
    @cart_item.change_quantity(-1)
    render 'change'
  end

  private

  # def set_cart_item
  #   @item = CartItem.find(params[:id])
  # end

end