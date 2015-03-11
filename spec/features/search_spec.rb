require 'feature_helper'

feature 'user can find good' do
  # given!(:good_with_title) { create(:good, name: 'catch name') }
  # given!(:good_with_desc) { create(:good, description: 'catch desc') }
  # given!(:wrong_good) { create(:good) }
  # before(:each) do
  #   ThinkingSphinx::Test.init
  #   ThinkingSphinx::Test.start
  #   index
  #   # sleep 0.5
  # end

  # scenario 'user tries to find good by name' do
  #   visit root_path
  #   within '.search' do
  #     find("input[id='search']").set('catch name')
  #     find("input[type='submit']").click
  #   end
  #   # save_and_open_page
  #   expect(page).to have_content 'catch name'
  #   expect(page).to_not have_content wrong_good.name
  # end

  # scenario 'user tries to find good by description' do
  #   visit root_path
  #   within '.search' do
  #     find("input[id='search']").set('catch desc')
  #     find("input[type='submit']").click
  #   end
  #   expect(page).to have_content 'catch desc'
  #   expect(page).to_not have_content wrong_good.description
  # end

  # after(:all) do
  #   ThinkingSphinx::Test.stop
  # end
  
end