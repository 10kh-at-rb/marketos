require "rails_helper"

RSpec.describe OrderNotificationMailer, type: :mailer do

  describe 'new order notification' do
    let!(:admin) { create(:admin) }
    let(:order) { create(:order) }
    let(:mail) { OrderNotificationMailer.new_order(order) }

    it 'renders headers' do
      expect(mail.subject).to eq I18n::t(:new_order)
      expect(mail.to).to eq([order.email])
      expect(mail.cc).to eq([admin.email])
    end

    it "renders body" do
      expect(mail.body.encoded).to match(/#{order.address}/)
    end
  end
end
