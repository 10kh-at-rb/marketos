# == Schema Information
#
# Table name: goods
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  price       :decimal(5, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  sale        :boolean          default("false")
#

require 'rails_helper'

RSpec.describe Good, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :category_id }

  it { should belong_to :category }
  it { should have_many :cart_items }
  it { should have_many :photos }
  it { should accept_nested_attributes_for :photos }

  describe 'change sale' do
    context 'when good is not in sale' do
      let(:good) { create(:good) }

      it 'should make sale attribute true' do
        good.change_sale
        good.reload
        expect(good.sale).to eq true
      end
    end

    context 'when good already in sale' do
      let(:good) { create(:good, sale: true) }

      it 'should make sale attribute false' do
        good.change_sale
        good.reload
        expect(good.sale).to eq false
      end
    end
  end
end
