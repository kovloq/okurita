class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.bigint :user_id, index:true
      t.integer :product_id
      t.bigint :order_id
      t.integer :quantity

      t.timestamps
    end
    add_foreign_key :order_details, :orders
  end
end
