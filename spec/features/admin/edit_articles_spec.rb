require 'feature_helper'

feature 'admin can edit article' do
  given(:admin) { create(:admin) }
  given(:article) { create(:article) }

  before do
    sign_in(admin)
    visit admin_article_path(article)
  end

  scenario 'admin tries to edit article' do
    find("a[href*='edit']").click

    find("input[id='article_title']").set("new article title")
    find("textarea[id='article_body']").set("<h6> new body </h6>")
    find("input[type='submit']").click
    
    expect(page).to have_content 'new article title'
    expect(page).to have_selector('h6', text: 'new body')
  end
end