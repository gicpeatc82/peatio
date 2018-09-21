class AddGoogleSecretToMembers < ActiveRecord::Migration
  def change
    add_column :members, :google_secret, :string
    add_column :members, :salt, :string
  end
end
