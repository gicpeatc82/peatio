class CreateTwoFactors < ActiveRecord::Migration
  def change
    create_table :two_factors do |t|

      t.timestamps null: false
    end
  end
end
