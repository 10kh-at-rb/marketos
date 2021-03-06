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
#  aasm_state   :string
#

class Order < ActiveRecord::Base
  include AASM
  PAYMENT_TYPES = %w(Cash Card)
  default_scope { order('created_at DESC') }
  has_many :cart_items
  belongs_to :user

  scope :active, -> { where(aasm_state: [:created, :delivery, :in_work]) }

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

  def change_status
    if self.may_work?
      self.work!
      return
    elsif self.may_delivery?
      self.delivery!
      return
    elsif self.may_finish?
      self.finish!
      return
    end
  end

end
