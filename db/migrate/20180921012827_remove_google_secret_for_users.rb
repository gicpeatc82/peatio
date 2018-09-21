class RemoveGoogleSecretForUsers < ActiveRecord::Migration
  def change
    remove_column :users, :google_secret
    remove_column :users, :salt
  end
end
