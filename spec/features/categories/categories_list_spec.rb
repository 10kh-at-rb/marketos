require 'feature_helper'

feature 'Categories list' do
  given!(:categories) { create_list(:category, 2) }

  scenario 'guest can see categories list at root path' do
    visit root_path

    expect(page).to have_content categories[0].title
    expect(page).to have_content categories[1].title
  end
end 