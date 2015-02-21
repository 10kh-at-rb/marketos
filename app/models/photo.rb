# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  good_id    :integer
#

class Photo < ActiveRecord::Base
  mount_uploader :file, GoodPicUploader
  belongs_to :good
end
