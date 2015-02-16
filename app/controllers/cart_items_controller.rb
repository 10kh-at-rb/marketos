class CartItemsController < ApplicationController

  before_action :set_cart_item
  respond_to :js

  def destroy
    @item.destroy
    redirect_to '/cart'
  end

  def increase
    @item.change_quantity(1)
    render 'change'
  end

  def decrease
    @item.change_quantity(-1)
    render 'change'
  end

  private

  def set_cart_item
    @item = CartItem.find(params[:id])
  end

end