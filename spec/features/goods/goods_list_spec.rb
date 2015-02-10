require 'feature_helper'

feature 'Goods list' do
  given!(:goods) { create_list(:good, 2) }

  scenario 'guest can see goods list at root path' do
    visit root_path

    expect(page).to have_content goods[0].name
    expect(page).to have_content goods[1].name
  end
end 