require 'feature_helper'

feature 'admin can see orders in dashboard', js: true do
  given(:admin) { create(:admin) }
  given(:first_good) { create(:good, name: 'First good', price: 13.89) }
  given(:second_good) { create(:good, name: 'Second good', price: 24.13) }

  before do
    2.times do
      create_order([first_good, second_good])
    end
    sign_in(admin)
  end

  scenario 'admin visits admin_path' do
    expect(page).to have_content t(:notification_orders, count: 2)
  end


end