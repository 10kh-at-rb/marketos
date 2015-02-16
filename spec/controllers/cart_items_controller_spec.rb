require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do

  describe 'PATCH #increase' do
    let(:cart_item) { create(:cart_item) }

    it 'should change quantity by 1' do
      patch :increase, id: cart_item, format: :js
      cart_item.reload

      expect(cart_item.quantity).to eq 2
    end
  end

  describe 'PATCH #decrease' do
    context 'when quantity > 1' do
      let(:cart_item) { create(:cart_item, quantity: 2) }

      it 'should change quantity by -1' do
        patch :decrease, id: cart_item, format: :js
        cart_item.reload

        expect(cart_item.quantity).to eq 1
      end
    end

    context 'when quantity eq 1' do
      let(:cart_item) { create(:cart_item) }

      it 'should not change quantity' do
        patch :decrease, id: cart_item, format: :js
        cart_item.reload

        expect(cart_item.quantity).to eq 1
      end
    end
  end

end