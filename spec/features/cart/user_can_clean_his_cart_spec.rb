require 'feature_helper' 

feature 'user can clean his cart', js: true do
  given(:good) { create(:good) }

  before do
    visit category_good_path(good.category, good)
    find("a[href*='add_to_cart']").click
  end

  scenario 'user deletes all items from cart' do
    visit cart_path

    click_on t(:delete_all_from_cart)

    expect(page).to_not have_content good.name
  end
end