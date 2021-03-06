# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
end
