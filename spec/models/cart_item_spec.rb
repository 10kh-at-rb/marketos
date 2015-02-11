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

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to :good }
  it { should belong_to :cart }

  describe 'total price' do
    let(:cart) { create(:cart) }
    let(:good) { create(:good) }

    it 'should return good.price * quantity' do
      2.times do
        cart.add_good(good)
      end

      expect(cart.cart_items.first.total_price).to eq 2*good.price
    end
  end
end
