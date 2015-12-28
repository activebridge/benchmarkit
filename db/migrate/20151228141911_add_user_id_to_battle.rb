class AddUserIdToBattle < ActiveRecord::Migration
  def change
    add_reference :battles, :user, index: true, foreign_key: true
  end
end
