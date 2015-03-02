require 'feature_helper'

feature 'admin can add good to sale', js: true do
  given(:admin) { create(:admin) }
  given!(:good) { create(:good) }

  before { sign_in(admin) }

  scenario 'admin adds good to sale' do
    visit admin_category_path(good.category)
    # find("input[name='good[sale]']").check
    check 'good[sale]'
    visit root_path
    within '.sale' do
      expect(page).to have_content good.name
    end
  end
end