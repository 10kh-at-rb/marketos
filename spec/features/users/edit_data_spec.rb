require 'feature_helper'

feature 'user can edit his profile' do
  given(:user) { create(:user) }
  before { sign_in(user) }

  # scenario 'user tries to edit his profile', js: true do
  #   visit profile_path
  #   page.find("a[href='#profile']").click
  #   save_and_open_page
  #   page.find("a[href='/profile/edit']").click

  #   fill_in 'user_name', with: 'New Name'
  #   fill_in 'user_phone', with: '9267584235'
  #   fill_in 'user_address', with: 'South Pole'

  #   click_on t(:save)

  #   click_on t(:show_profile)

  #   expect(page).to have_content 'New name'
  #   expect(page).to have_content '9267584235'
  #   expect(page).to have_content 'South Pole'
  # end
end