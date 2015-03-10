require 'feature_helper'

feature 'user can create with his cart items', js: true do

  given(:first_good) { create(:good, name: 'First good', price: 13.89) }
  given(:second_good) { create(:good, name: 'Second good', price: 24.13) }
  given(:user) { create(:user, name: 'SignedUser', phone: '0123456789', address: 'North Pole') }

  before do
    visit good_path(first_good)
    find("a[href*='add_to_cart']").click
    visit good_path(second_good)
    find("a[href*='add_to_cart']").click
    visit cart_path
  end

  scenario 'when current cart is empty' do
    find("a[id='clean-cart']").click

    expect(page).to_not have_content 'Checkout'
  end

  context 'when current cart is not empty' do

    scenario 'with valid attributes', js: true do

      find("a[href='/orders/new']").click

      within '.order-form' do
        find("input[id='order_name']").set('Sergey')
        find("input[id='order_phone']").set('0123456789')
        find("textarea[id='order_address']").set('North Pole' )

        find("input[type='submit']").click
      end
      
      expect(page).to have_content t(:order_created, name: 'Sergey')
      expect(page).to have_content '0123456789'
      expect(page).to have_content 'North Pole'
      expect(page).to have_content first_good.name
      expect(page).to have_content second_good.name

    end

    scenario 'with invalid attributes' do
      find("a[href='/orders/new']").click
      within '.order-form' do
        find("input[type='submit']").click
      end

      expect(page).to have_content t('activerecord.errors.messages.blank')
    end
      
    scenario 'when user signed in' do
      sign_in(user)
      visit cart_path
      find("a[href='/orders/new']").click
      within '.order-form' do
        find("input[type='submit']").click
      end

      expect(page).to have_content t(:order_created, name: user.name)
      expect(page).to have_content '0123456789'
      expect(page).to have_content 'North Pole'
      expect(page).to have_content first_good.name
      expect(page).to have_content second_good.name
    end

  end

end