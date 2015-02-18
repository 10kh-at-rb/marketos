# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  name                            :string           not null
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  admin                           :boolean          default("false")
#  phone                           :string
#  address                         :text
#

FactoryGirl.define do

  sequence :email do |n|
    "testuser-#{n}@market.test"
  end

  sequence :name do |n|
    "testuser-#{n}"
  end

  sequence :admin_name do |n|
    "admin-#{n}"
  end

  factory :user do
    name
    email
    password "0123456789"   
    password_confirmation "0123456789"
    admin false
    salt "0ed165ec489b3da4f0e4ea40743ed3402e1d8242c00515e0016ec9e5a"
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("0123456789", "0ed165ec489b3da4f0e4ea40743ed3402e1d8242c00515e0016ec9e5a")
  end

  factory :admin, class: User do
    name { generate :admin_name }
    email
    password "0123456789"   
    password_confirmation "0123456789"
    admin true
    salt "0ed165ec489b3da4f0e4ea40743ed3402e1d8242c00515e0016ec9e5a"
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("0123456789", "0ed165ec489b3da4f0e4ea40743ed3402e1d8242c00515e0016ec9e5a")
  end

end
