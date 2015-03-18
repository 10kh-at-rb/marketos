# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  picture     :string
#  parent_id   :integer
#

class Category < ActiveRecord::Base

  extend FriendlyId

  friendly_id :title, use: [:slugged, :finders]
  has_many :goods
  has_many :child_categories, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Category"

  scope :root, ->{ where(parent: nil) }
  mount_uploader :picture, CategoryPicUploader
  validates :title, presence: true
end
