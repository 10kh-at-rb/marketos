require 'feature_helper'

feature 'User can see good page' do

  given(:good) { create(:good) }
  
  scenario 'user visits good_path' do
    visit category_good_path(good.category, good)

    expect(page).to have_content good.name
    expect(page).to have_content good.price
    expect(page).to have_content good.description
  end

end