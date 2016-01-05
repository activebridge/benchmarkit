class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :head_battle, index: true
      t.references :comment_battle, index: true
      t.references :user, index: true
      t.text :text

      t.timestamps null: false
    end
  end
end
