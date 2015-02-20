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
#

class Category < ActiveRecord::Base
  has_many :goods
  mount_uploader :picture, CategoryPicUploader
  validates :title, presence: true
end
