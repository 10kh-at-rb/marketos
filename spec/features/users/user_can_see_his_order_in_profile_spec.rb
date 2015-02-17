require 'feature_helper'

feature 'Registred user can see his order in profile', js: true do
  given(:user) { create(:user) }
  given(:first_good) { create(:good, name: "First good") }
  given(:second_good) { create(:good, name: "Second good") }
  before do
    sign_in(user)
    [first_good, second_good].each do |good|
      visit good_path(good)
      click_on "Add to cart"
    end
    visit cart_path
    find("a[href='/orders/new']").click
    fill_in 'Phone', with: '0123456789'
    fill_in 'Address', with: 'North Pole' 
    click_on 'Save order'
  end

  scenario 'user visits his profile' do
    visit profile_path

    expect(page).to have_content '1 order'
    expect(page).to have_content 'First good'
    expect(page).to have_content 'Second good'

  end

  scenario 'guest tries to visit profile' do
    click_on 'Logout'
    visit profile_path

    expect(page).to have_content 'You are guest and have not profile'
    expect(page).to_not have_content 'First good'
    expect(page).to_not have_content 'Second good'
  end

end