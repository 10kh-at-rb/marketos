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

require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_confirmation }
  it { should validate_length_of(:password).is_at_least(4) }
  it { should validate_confirmation_of :password }
  it { should have_many :orders }
  it { should have_one :cart }

end
