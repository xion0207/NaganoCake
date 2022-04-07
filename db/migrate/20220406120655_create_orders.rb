class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :subtotal, null: false
      t.integer :payment_method, null: false, default: "0"
      t.integer :status, null: false, default: "0"
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false

      t.timestamps
    end
  end
end
