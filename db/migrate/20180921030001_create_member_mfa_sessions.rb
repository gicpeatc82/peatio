class CreateMemberMfaSessions < ActiveRecord::Migration
  def change
    create_table :member_mfa_sessions do |t|

      t.timestamps null: false
    end
  end
end
