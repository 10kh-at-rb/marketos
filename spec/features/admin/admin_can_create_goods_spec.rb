require 'feature_helper'

feature 'admin can create good' do

  given(:admin) { create(:admin) }
  given!(:category) { create(:category) }

  before { sign_in(admin) }

  scenario 'admin tries to create good' do
    visit admin_path
    find("a[href='/admin/goods/new']").click

    find("input[id='good_name']").set("test good")
    find("textarea[id='good_description']").set("test good description")
    find("input[id='good_price']").set("89.32")
    find("input[type='submit']").click

    visit category_path(category)
    expect(page).to have_content "test good"
  end

end