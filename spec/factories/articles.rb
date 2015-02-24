FactoryGirl.define do
  
  sequence :title do |n|
    "article-#{n}"
  end

  factory :article do
    title
    body "<h6> Test article body </h6>"
  end

end
