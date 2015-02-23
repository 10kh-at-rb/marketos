require 'feature_helper'

feature 'admin can edit goods' do

  given(:good) { create(:good) }
  given(:admin) { create(:admin) }

  before do
    sign_in(admin)
    visit admin_good_path(good)
    find("a[href*='edit']").click
  end

  scenario 'admin tries to edit good' do
    find("input[id='good_name']").set("new good name")
    find("textarea[id='good_description']").set("new good description")
    find("input[id='good_price']").set("89.32")
    find("input[type='submit']").click

    expect(page).to have_content 'new good name'
  end

end