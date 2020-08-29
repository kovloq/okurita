class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.bigint :category_id, index:true

      t.timestamps
    end
    add_foreign_key :posts, :categories
  end
end
