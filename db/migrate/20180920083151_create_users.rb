class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :salt
      t.string :google_secret

      t.timestamps null: false
    end
  end
end
