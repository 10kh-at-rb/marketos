# == Schema Information
#
# Table name: goods
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  price       :decimal(5, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  sale        :boolean          default("false")
#

class Good < ActiveRecord::Base

  has_many :cart_items, dependent: :restrict_with_error
  has_many :photos, dependent: :destroy
  belongs_to :category
  validates :name, :price, :category_id, presence: true
  accepts_nested_attributes_for :photos, allow_destroy: true

  scope :sale, -> { where(sale: true) }

  def change_sale
    self.update!(sale: !sale)
  end

  def self.top_selled(limit)
    query = CartItem.select("good_id").group("good_id").order("sum(quantity) DESC").limit(limit).map(&:good_id)
    find(query)
  end

end
