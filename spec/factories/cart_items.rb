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

FactoryGirl.define do
  factory :cart_item do
    cart
    good
    quantity 1
  end

end
