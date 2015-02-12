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
#  order_id   :integer
#

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to :good }
  it { should belong_to :cart }
  it { should belong_to :order }

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

  describe 'change_quantity' do
    
    context 'when quantity remain positive' do
      let(:cart_item) { create(:cart_item) }
    
      it 'should change_quantity by arg' do
        cart_item.change_quantity(3)

        expect(cart_item.quantity).to eq 4
      end

    end

    context 'when quantity remain negative' do
      let(:cart_item) { create(:cart_item, quantity: 4) }

      it 'should not change_quantity' do
        cart_item.change_quantity(-10)

        expect(cart_item.quantity).to eq 4
      end
    end

  end
end
