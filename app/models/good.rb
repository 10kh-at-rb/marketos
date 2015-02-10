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
#

class Good < ActiveRecord::Base

  belongs_to :category
  validates :name, :price, :category_id, presence: true
end
