class AddOrderToCartItems < ActiveRecord::Migration
  def change
    add_reference :cart_items, :order, index: true
    add_foreign_key :cart_items, :orders
  end
end
