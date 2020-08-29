class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :shipping_id
      t.integer :shipping_fee
      t.integer :commision_fee
      t.integer :packing_fee
      t.integer :status_id
      t.string :order_number

      t.timestamps
    end
    add_foreign_key :orders, :shippings
  end
end
