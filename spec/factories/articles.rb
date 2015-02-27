# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  
  sequence :title do |n|
    "article-#{n}"
  end

  factory :article do
    title
    body "<h6> Test article body </h6>"
  end

end
