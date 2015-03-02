class AddSaleToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :sale, :boolean, default: false
  end
end
