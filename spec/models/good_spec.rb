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

require 'rails_helper'

RSpec.describe Good, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :category_id }

  it { should belong_to :category }
end
