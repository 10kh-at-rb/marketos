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
#  user_id      :integer
#

FactoryGirl.define do
  factory :order do
    name "Sergey"
    email "sergey@market.test"
    phone "0123456789"
    address "North Pole"
    payment_type "Cash"
  end

end
