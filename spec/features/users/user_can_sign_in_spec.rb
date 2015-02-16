require 'feature_helper'

feature 'user can sign in with his account' do

  given!(:user) { create(:user) }

  before { visit root_path }

  scenario 'with valid attributes' do
    sign_in(user)

    within '.navbar' do
      expect(page).to have_content user.name
    end
  end

  scenario 'with invalid attributes' do
    find("a[href='/login']").click
    click_on "Login"

    expect(page).to have_content "Email or password are invalid"

  end

end