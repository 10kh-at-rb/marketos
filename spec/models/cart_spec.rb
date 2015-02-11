# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many :cart_items }

  describe 'add good' do
    let(:cart) { create(:cart) }
    let(:good) { create(:good) }

    context 'if cart item with the good does not exist' do
      it 'should create cart item with the good' do
        expect{ cart.add_good(good) }.to change(cart.cart_items, :count).by(1)
      end
    end

    context 'if cart item with the good already exists' do
      before { cart.add_good(good) }

      it 'should not create new cart_item' do
        expect{ cart.add_good(good) }.to_not change(cart.cart_items, :count)
      end

      it 'should change quantity' do
        cart.add_good(good)

        expect(cart.cart_items.first.quantity).to eq 2
      end  
    end
  end
end
