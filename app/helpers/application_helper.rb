module ApplicationHelper

  def cache_key_for_sidebar
    count = Category.count
    "categories/all-#{count}"
  end

  def cache_key_for_sale
    count = Good.sale.count
    max_updated_at = Good.sale.maximum(:updated_at).try(:to_s, :number)
    "sale/sale-#{count}-#{max_updated_at}"
  end

end
