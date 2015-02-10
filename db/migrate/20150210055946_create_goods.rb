class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 5, scale: 2

      t.timestamps null: false
    end

    add_index :goods, :name
  end
end
