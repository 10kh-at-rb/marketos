require 'feature_helper' 

feature 'user can sign in admin interface if he is an admin' do

  given!(:user) { create(:user) }
  given!(:admin) { create(:admin) }

  before { visit admin_path }

  scenario 'not admin tries to log in admin interface' do
    within '.login-form' do
      find("input[id='name']").set(user.name)
      find("input[id='password']").set('0123456789')
      find("input[type='submit']").click
    end

    expect(page).to_not have_content 'Hello admin'
  end

  scenario 'admin user tries to log in admin interface' do
    within '.login-form' do
      find("input[id='name']").set(admin.name)
      find("input[id='password']").set('0123456789')
      find("input[type='submit']").click
    end
    
    expect(page).to have_content 'Hello admin'
  end

end