# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  good_id    :integer
#

FactoryGirl.define do
  factory :photo do
    file "MyString"
  end

end
