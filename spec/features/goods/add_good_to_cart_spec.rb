require 'feature_helper' 

feature 'user can add good to cart' do

  given(:good) { create(:good) }

  scenario 'from category page', js: :true do
    visit category_page(good.category)
    click_on "Add to cart"

    within '.current_cart' do
      expect(page).to have_content "1 item"
    end
  end

  scenario 'from good page', js: :true do
    visit good_page(good)
    click_on 'Add to cart'

    within '.current_cart' do
      expect(page).to have_content "1 item"
    end
  end

end