require 'feature_helper'

feature 'User can delete cart item from cart' do

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
    
    within ".item-#{first_good.id}" do
      find("a[id^='remove-item']").click
    end

    expect(page).to_not have_content first_good.name
    expect(page).to have_content second_good.name
  end

end