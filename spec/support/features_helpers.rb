module FeaturesHelpers

  def sign_in(user)

    visit login_path
    within '.login-form' do
      find("input[id='name']").set(user.name)
      find("input[id='password']").set('0123456789')
      find("input[type='submit']").click
    end

  end

  def t(*args)
    I18n.translate!(*args)
  end

  def create_order(goods)

    goods.each do |good|
      visit category_good_path(good.category, good)
      find("a[href*='add_to_cart']").click
    end

    visit cart_path

    find("a[href='/orders/new']").click
    within '.order-form' do
      find("input[id='order_name']").set('Sergey')
      find("input[id='order_phone']").set('0123456789')
      find("textarea[id='order_address']").set('North Pole' )

      find("input[type='submit']").click
    end
  end
end