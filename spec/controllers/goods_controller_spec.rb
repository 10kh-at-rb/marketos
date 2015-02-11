require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
  describe 'POST #add_to_cart' do
    let(:good) { create(:good) }

    it 'saves cart_item in db' do
      expect{ post :add_to_cart, id: good.id}.to change(good.cart_items, :count).by(1)
    end

  end
end
