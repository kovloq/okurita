class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, index:true
      t.string :password
      t.string :email, index:true
      t.boolean :is_newsletter 
      t.integer :country_id
      t.date :birth_date
      t.timestamps
    end
  end
end
