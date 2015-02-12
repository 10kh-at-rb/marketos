# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  email        :string
#  phone        :string           not null
#  address      :text
#  payment_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Order < ActiveRecord::Base
  PAYMENT_TYPES = %w(Cash Card)

  has_many :cart_items

  validates :name, :phone, :payment_type, presence: true
  validates :payment_type, inclusion: PAYMENT_TYPES

end
