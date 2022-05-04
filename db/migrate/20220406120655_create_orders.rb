class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :subtotal
      t.integer :payment_method, default: "0"
      t.integer :status, default: "0"
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage

      t.timestamps
    end
  end
end
