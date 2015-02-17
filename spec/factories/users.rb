# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  name                            :string           not null
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  admin                           :boolean          not null
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#

FactoryGirl.define do

  sequence :email do |n|
    "testuser-#{n}@market.test"
  end

  sequence :name do |n|
    "testuser-#{n}"
  end

  factory :user do
    name
    email
    password "0123456789"   
    password_confirmation "0123456789" 
    salt "0ed165ec489b3da4f0e4ea40743ed3402e1d8242c00515e0016ec9e5a"
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("0123456789", "0ed165ec489b3da4f0e4ea40743ed3402e1d8242c00515e0016ec9e5a")
  end

end
