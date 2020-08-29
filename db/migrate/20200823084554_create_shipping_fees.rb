class CreateShippingFees < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_fees do |t|
      t.bigint :shipping_id
      t.string :area_1
      t.string :area_2
      t.string :area_3
      t.string :area_4
      t.integer :weight
      t.integer :fee

      t.timestamps
    end
  end
end
