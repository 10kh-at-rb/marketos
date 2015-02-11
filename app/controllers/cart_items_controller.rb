class CartItemsController < ApplicationController

  def destroy
    @item = CartItem.find(params[:id])
    @item.destroy
    redirect_to '/cart'
  end

end