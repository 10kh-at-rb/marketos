require 'feature_helper'

feature 'admin can create category' do
  given(:admin) { create(:admin) }

  before { sign_in(admin) }

  scenario 'admin tries to create category' do
    visit admin_path
    find("a[href='/admin/categories/new']").click

    find("input[id='category_title']").set("test category")
    find("textarea[id='category_description']").set("test category description")
    find("input[type='submit']").click
    visit categories_path
    expect(page).to have_content 'test category'
  end
end