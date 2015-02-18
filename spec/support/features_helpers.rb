module FeaturesHelpers

  def sign_in(user)

    visit login_path
    find("input[id='name']").set(user.name)
    find("input[id='password']").set('0123456789')
    find("input[type='submit']").click

  end

  def t(*args)
    I18n.translate!(*args)
  end
end