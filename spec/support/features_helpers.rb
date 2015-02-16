module FeaturesHelpers

  def sign_in(user)

    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: "0123456789"
    click_on "Login"

  end
end