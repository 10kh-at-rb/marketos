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
#  user_id      :integer
#  status       :string
#  aasm_state   :string
#

class Order < ActiveRecord::Base
  include AASM
  PAYMENT_TYPES = %w(Cash Card)

  has_many :cart_items
  belongs_to :user

  validates :name, :phone, :payment_type, presence: true
  validates :payment_type, inclusion: PAYMENT_TYPES

  aasm do
    state :created, initial: true
    state :in_work
    state :delivery
    state :finished

    event :work do
      transitions from: :created, to: :in_work
    end    

    event :delivery do
      transitions from: :in_work, to: :delivery
    end

    event :finish do
      transitions from: :delivery, to: :finished
    end
  end

  def add_items_from_cart(cart)
    cart.cart_items.each do |item|
      cart_items.create!(good_id: item.good_id, quantity: item.quantity)
    end
  end

  def total_price
    cart_items.map(&:total_price).sum
  end

end
