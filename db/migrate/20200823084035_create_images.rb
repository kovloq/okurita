class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url
      t.bigint :product_id

      t.timestamps
    end
    add_foreign_key :images, :products
  end
end
