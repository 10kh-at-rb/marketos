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

FactoryGirl.define do
  factory :good do
    name "test good"
    price 14.99
    description %q(Test good description)    
    category
  end

end
