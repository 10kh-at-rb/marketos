require 'feature_helper'

feature 'All can see articles' do
  given(:article) { create(:article, title: 'Test article title', body: '<h6> Test article body </h6>') }

  scenario 'user visits article page' do
    visit article_path(article)

    expect(page).to have_content 'Test article title'
    expect(page).to have_selector('h6', text: 'Test article body')
  end
end