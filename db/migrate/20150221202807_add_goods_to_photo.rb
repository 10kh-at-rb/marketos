class AddGoodsToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :good, index: true
    add_foreign_key :photos, :goods
  end
end
