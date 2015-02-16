require 'feature_helper'

feature 'users can sign out' do
  given(:user) { create(:user) }

  before { sign_in(user) }

  scenario 'user tries to sign out' do
    within('.navbar') do
      click_on 'Logout'
    end

    expect(page).to have_content 'Sign in'
  end
end