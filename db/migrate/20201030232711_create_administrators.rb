class CreateAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|
      t.string :email
      t.string :password_digest
      t.string :force

      t.timestamps
    end
    add_index :administrators, :email, unique: true
  end
end
