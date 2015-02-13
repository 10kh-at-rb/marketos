# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def add_good(good)
    existed_cart_item = cart_items.find_by(good_id: good.id)
    if existed_cart_item
      existed_cart_item.quantity += 1
      existed_cart_item.save!
    else
      cart_items.create(good_id: good.id)
    end
  end

  def total_price
    cart_items.map(&:total_price).sum
  end

  def empty?
    cart_items.empty?
  end
end
