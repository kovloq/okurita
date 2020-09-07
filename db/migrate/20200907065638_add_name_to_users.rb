class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, index:true
    add_column :users, :is_newsletter , :boolean
    add_column :users, :country_id , :integer
    add_column :users, :birth_date , :date
  end
end
