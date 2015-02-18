require 'feature_helper'

feature 'Registred user can see his order in profile', js: true do
  given(:user) { create(:user) }
  given(:first_good) { create(:good, name: "First good") }
  given(:second_good) { create(:good, name: "Second good") }
  before do
    sign_in(user)
    [first_good, second_good].each do |good|
      visit good_path(good)
      find("a[href*='add_to_cart']").click
    end
    visit cart_path
    find("a[href='/orders/new']").click
    find("input[id='order_phone']").set('0123456789')
    find("textarea[id='order_address']").set('North Pole' )
    
    click_on t(:save_order)
  end

  scenario 'user visits his profile' do
    visit profile_path
    find("a[data-parent='#accordion']").click

    expect(page).to have_content t("notification_orders", count: 1)
    expect(page).to have_content 'First good'
    expect(page).to have_content 'Second good'

  end

  scenario 'guest tries to visit profile' do
    click_on t('logout')
    visit profile_path

    expect(page).to have_content 'You are guest and have not profile'
    expect(page).to_not have_content 'First good'
    expect(page).to_not have_content 'Second good'
  end

end