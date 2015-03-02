class OrderNotificationMailer < ApplicationMailer

  def new_order(order)
    admin_emails = User.admins.select(:email).map(&:email)
    @order = order
    mail to: @order.email, cc: admin_emails ,subject: t(:new_order)
  end

end
