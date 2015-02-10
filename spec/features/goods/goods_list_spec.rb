require 'feature_helper'

feature 'Goods list' do
  let!(:test_category) { create(:category, title: "Best") }
  given!(:goods) { create_list(:good, 2, category: test_category) }

  scenario 'guest can see goods list at category path' do
    visit category_path(test_category)

    expect(page).to have_content goods[0].name
    expect(page).to have_content goods[1].name
  end
end 