require 'feature_helper'

feature 'categories list in dashboard' do

  given(:admin) { create(:admin) }
  given!(:category) { create(:category) }

  before { sign_in(admin) }

  scenario 'admin can see categories in dashboard' do
    visit admin_path
    find("a[href='/admin/categories']").click

    expect(page).to have_content category.title

  end
end