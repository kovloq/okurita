class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.bigint :user_id, index: true
      t.integer :amount
      t.boolean :is_active

      t.timestamps
    end
    add_foreign_key :deposits, :users
  end
end
