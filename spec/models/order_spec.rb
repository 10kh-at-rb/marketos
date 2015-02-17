# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  email        :string
#  phone        :string           not null
#  address      :text
#  payment_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  
  it { should have_many :cart_items }
  it { should belong_to :user }

  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :payment_type }
  it { should validate_inclusion_of(:payment_type).in_array(%w(Cash Card)) }

  describe 'add_items_from_cart' do
    let(:good) { create(:good) }
    let(:cart) { create(:cart) }
    let(:order) { create(:order) }

    before do
      cart.add_good(good)
      order.add_items_from_cart(cart)
    end

    it 'should create cart_items for order' do
      expect(order.cart_items.count).to eq 1
    end

    it 'should create cart_items with correct good and quantity' do
      expect(order.cart_items.first.good.name).to eq good.name
      expect(order.cart_items.first.quantity).to eq 1
    end
  end

end
