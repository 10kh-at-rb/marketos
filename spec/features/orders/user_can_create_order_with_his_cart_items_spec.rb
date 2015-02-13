require 'feature_helper'

feature 'user can create with his cart items' do

  given(:first_good) { create(:good, name: 'First good', price: 13.89) }
  given(:second_good) { create(:good, name: 'Second good', price: 24.13) }

  before do
    visit good_path(first_good)
    click_on 'Add to cart'
    visit good_path(second_good)
    click_on 'Add to cart'
    visit cart_path
  end

  scenario 'when current cart is empty' do
    find("a[id='clean-cart']").click

    expect(page).to_not have_content 'Checkout'
  end

  context 'when current cart is not empty' do

    scenario 'with valid attributes' do

      find("a[href='/orders/new']").click

      fill_in 'Name', with: 'Sergey'
      fill_in 'Phone', with: '0123456789'
      fill_in 'Address', with: 'North Pole' 

      click_on 'Save order'

      expect(page).to have_content 'Thank you for order, Sergey'
      expect(page).to have_content '0123456789'
      expect(page).to have_content 'North Pole'
      expect(page).to have_content first_good.name
      expect(page).to have_content second_good.name

    end

    scenario 'with invalid attributes' do
      find("a[href='/orders/new']").click
      click_on 'Save order'

      expect(page).to have_content 'Name can\'t be blank '
    end

  end

end