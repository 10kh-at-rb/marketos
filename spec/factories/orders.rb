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

FactoryGirl.define do
  factory :order do
    name "MyString"
email "MyString"
phone "MyString"
address "MyText"
payment_type "MyString"
  end

end
