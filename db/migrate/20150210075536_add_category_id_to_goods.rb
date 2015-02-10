class AddCategoryIdToGoods < ActiveRecord::Migration
  def change
    add_reference :goods, :category, index: true
    add_foreign_key :goods, :categories
  end
end
