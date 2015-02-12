require 'feature_helper'

feature 'user can change item quantity in cart' do

  given(:good) { create(:good) }

  before do
    visit good_path(good)
    click_on "Add to cart"
    visit cart_path
  end

  scenario 'user tries to increase item quantity' do

    find("a[id^='increase-item']").click

    within '.quantity_value' do
      expect(page).to have_content '2'
    end
  end

  scenario 'user tries to decrease item quantity when quantity > 1' do
    # save_and_open_page
    find("a[id^='increase-item']").click
    find("a[id^='decrease-item']").click

    within '.quantity_value' do
      expect(page).to have_content '1'
    end
  end

  scenario 'user tries to decrease item quantity when quantity < 1' do
    find("a[id^='decrease-item']").click

    within '.quantity_value' do
      expect(page).to have_content '1'
    end
  end

end