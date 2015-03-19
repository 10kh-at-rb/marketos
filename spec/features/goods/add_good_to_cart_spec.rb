require 'feature_helper' 

feature 'user can add good to cart' do

  given(:good) { create(:good) }

  scenario 'from category page', js: :true do
    visit category_path(good.category)
    find("a[href*='add_to_cart']").click

    within '#current-cart' do
      expect(page).to have_content "1 item"
    end
  end

  scenario 'from good page', js: :true do
    visit category_good_path(good.category, good)
    find("a[href*='add_to_cart']").click

    within '#current-cart' do
      expect(page).to have_content "1 item"
    end
  end

end