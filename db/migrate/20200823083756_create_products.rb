class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.bigint :shop_id, index: true
      t.string :url
      t.string :product_number
      t.integer :price
      t.text :description
      t.boolean :is_preorder
      t.bigint :category_id, index:true
      t.timestamps
    end
    add_foreign_key :products, :shops
    add_foreign_key :products, :categories
  end
end
