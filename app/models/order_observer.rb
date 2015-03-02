class OrderObserver < ActiveRecord::Observer
  observe :order

  def after_save(record)
    OrderNotificationMailer.new_order(record).deliver_later
  end
end