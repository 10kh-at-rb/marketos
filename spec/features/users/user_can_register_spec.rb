require 'feature_helper'

feature 'User can register in our app' do

  before { visit signup_path }

  scenario 'with valid attributes' do
    find("input[id='user_name']").set('Sergey')
    find("input[id='user_email']").set('sergey@market.test')
    find("input[id='user_password']").set('0123')
    find("input[id='user_password_confirmation']").set('0123')

    click_on t(:save_user)

    within '.navbar' do
      expect(page).to have_content 'Sergey'
    end

  end

  scenario 'with invalid attributes' do
    click_on t(:save_user)

    expect(page).to have_content t('activerecord.errors.messages.blank')
  end

end