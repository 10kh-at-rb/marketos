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

class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentication_class = Authentication
  end

  has_one :cart
  has_many :orders
  has_many :authentications, dependent: :destroy

  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :name, :email, :password_confirmation, presence:  true

  scope :admins, -> { where(admin: true) }

end
