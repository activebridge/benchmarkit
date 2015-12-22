class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :uid
      t.string :email
      t.string :nickname
      t.string :name
      t.string :image
      t.string :url
      t.string :token

      t.timestamps null: false
    end
  end
end
