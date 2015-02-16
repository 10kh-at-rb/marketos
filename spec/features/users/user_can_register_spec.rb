require 'feature_helper'

feature 'User can register in our app' do

  before { visit signup_path }

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Sergey'
    fill_in 'Email', with: 'sergey@market.test'
    fill_in 'Password', with: '0123'
    fill_in 'Password confirmation', with: '0123'

    click_on 'Sign up'

    within '.navbar' do
      expect(page).to have_content 'Sergey'
    end

  end

  scenario 'with invalid attributes' do
    click_on 'Sign up'

    expect(page).to have_content 'Name can\'t be blank'
  end

end