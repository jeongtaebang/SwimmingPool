class AddOmniauthFbToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string

    add_index :users, :provider
  	add_index :users, :uid
  end
end
