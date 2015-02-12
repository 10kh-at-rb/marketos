class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone, null: false
      t.text :address
      t.string :payment_type, null: false

      t.timestamps null: false
    end
  end
end
