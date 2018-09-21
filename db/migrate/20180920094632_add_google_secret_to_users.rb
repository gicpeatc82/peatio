class AddGoogleSecretToUsers < ActiveRecord::Migration
  def change
    add_column :users, :google_secret, :string
    add_column :users, :salt, :string
  end
end
