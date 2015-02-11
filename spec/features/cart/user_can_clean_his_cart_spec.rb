require 'feature_helper' 

feature 'user can clean his cart' do
  given(:good) { create(:good) }

  before do
    visit good_path(good)
    click_on "Add to cart"
  end

  scenario 'user deletes all items from cart' do
    visit cart_path
    save_and_open_page
    click_on 'Delete all from cart' 

    expect(page).to_not have_content good.name
  end
end