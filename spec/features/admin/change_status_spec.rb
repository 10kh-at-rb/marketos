require 'feature_helper'

feature 'admin can change order status', js: true do
  given(:admin) { create(:admin) }
  given!(:order) { create(:order) }

  before do
    sign_in(admin)
    visit admin_path
  end

  context 'from created to working' do
    
    before do
      visit admin_path
      # find("a[data-toggle='collapse']").click
      save_and_open_page
      find("a[href*='change_status']").click
    end

    scenario 'from created to work' do
      expect(page).to have_content t('activerecord.attributes.order.aasm_state.in_work')
    end
  end

  scenario 'from working to delivery'
  scenario 'from delivery to finished'

end