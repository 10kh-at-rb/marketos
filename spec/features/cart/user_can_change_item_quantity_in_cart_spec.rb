require 'feature_helper'

feature 'user can change item quantity in cart', js: true do

  given(:good) { create(:good) }

  before do
    visit good_path(good)
    find("a[href*='add_to_cart']").click
    visit cart_path
  end

  scenario 'user tries to increase item quantity' do

    find("a[id^='increase-item']").click

    within '.quantity_value' do
      expect(page).to have_content '2'
    end
  end

  scenario 'user tries to decrease item quantity when quantity > 1' do

    find("a[id^='increase-item']").click
    sleep 1
    find("a[id^='decrease-item']").click
    sleep 1

    within '.quantity_value' do
      expect(page).to have_content '1'
    end
  end

  scenario 'user tries to decrease item quantity when quantity = 1' do
    find("a[id^='decrease-item']").click

    within '.quantity_value' do
      expect(page).to have_content '1'
    end
  end

end