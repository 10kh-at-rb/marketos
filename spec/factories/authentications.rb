# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  provider   :string           not null
#  uid        :string           not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :authentication do
    
  end

end
