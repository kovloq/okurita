class CreateRefunds < ActiveRecord::Migration[6.0]
  def change
    create_table :refunds do |t|
      t.bigint :user_id, index: true
      t.integer :amount
      t.boolean :is_active

      t.timestamps
    end
    add_foreign_key :refunds, :users
  end
end
