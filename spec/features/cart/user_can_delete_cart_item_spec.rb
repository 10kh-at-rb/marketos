require 'feature_helper'

feature 'User can delete cart item from cart' do

  # given(:cart) { create(:cart) }
  given(:first_good) { create(:good, name: 'First') }
  given(:second_good) { create(:good, name: 'Second') }

  before do
    [first_good, second_good].each do |good|
      visit good_path(good)
      click_on "Add to cart"
    end
  end

  scenario 'user deletes first good from cart' do
    visit cart_path
    # save_and_open_page
    within ".item-1" do
      click_on 'Delete item'
    end

    expect(page).to_not have_content first_good.name
    expect(page).to have_content second_good.name
  end

end