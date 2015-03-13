# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  picture     :string
#  parent_id   :integer
#

FactoryGirl.define do
  factory :category do
    title "test category"    
    description %q(Description of test category)
  end

end
