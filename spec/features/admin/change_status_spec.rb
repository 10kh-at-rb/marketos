require 'feature_helper'

feature 'admin can change order status', js: true do
  given(:admin) { create(:admin) }
  given!(:order) { create(:order) }

  before do
    sign_in(admin)
    visit admin_path
  end

  context 'initial status is created' do
    scenario 'created' do
      expect(page).to have_content t('activerecord.attributes.order.aasm_state.created')
    end
  end

  context 'from created to working' do    
    before do
      find("a[href*='change_status']").click
    end

    scenario 'from created to work' do
      expect(page).to have_content t('activerecord.attributes.order.aasm_state.in_work')
    end
  end

end