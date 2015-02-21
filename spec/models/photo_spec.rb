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

require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should belong_to :good }
end
