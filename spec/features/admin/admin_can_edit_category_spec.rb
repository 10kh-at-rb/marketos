require 'feature_helper'

feature 'admin can edit category' do

  given(:admin) { create(:admin) }
  given!(:category) { create(:category) }

  before do
    sign_in(admin)
    visit admin_path
    within '.navbar' do
      find("a[href*='admin/categories']").click
    end
  end

  scenario 'with valid attributes' do
    find("a[href*='edit']").click

    find("input[id='category_title']").set("new category title")
    find("textarea[id='category_description']").set("test category description")
    find("input[type='submit']").click
    visit categories_path
    expect(page).to have_content 'new category title'
  end

end