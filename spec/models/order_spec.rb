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

  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :payment_type }
  it { should validate_inclusion_of(:payment_type).in_array(%w(Cash Card)) }

end
