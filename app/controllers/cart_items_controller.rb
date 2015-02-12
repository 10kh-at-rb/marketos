class CartItemsController < ApplicationController

  before_action :set_cart_item

  def destroy
    @item.destroy
    redirect_to '/cart'
  end

  def increase
    @item.change_quantity(1)
    redirect_to cart_path
  end

  def decrease
    @item.change_quantity(-1)
    redirect_to cart_path
  end

  private

  def set_cart_item
    @item = CartItem.find(params[:id])
  end

end