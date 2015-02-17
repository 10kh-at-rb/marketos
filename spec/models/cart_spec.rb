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
  it { should belong_to :user }

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

  describe 'total_price' do
    let(:first_good) { create(:good) }
    let(:second_good) { create(:good, price: 46.78) }
    let(:cart) { create(:cart) }

    before do
      cart.add_good(first_good)
      cart.add_good(second_good)
    end

    it 'should return total_price of goods' do
      expect(cart.total_price).to eq first_good.price + second_good.price
    end 
  end

  describe 'empty?' do
    let(:cart) { create(:cart) }
    let(:good) { create(:good) }

    it 'should return false if there is no cart_items in cart' do
      expect(cart.empty?).to eq true
    end

    it 'should return false if there is cart_items in cart' do
      cart.add_good(good)
      expect(cart.empty?).to eq false
    end
  end
end
