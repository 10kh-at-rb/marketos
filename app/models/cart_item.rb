# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default("1")
#

class CartItem < ActiveRecord::Base
  belongs_to :good
  belongs_to :cart

  def total_price
    good.price * quantity
  end

  def change_quantity(increment)
    update(quantity: (quantity + increment)) if (quantity + increment) > 0
  end
end
