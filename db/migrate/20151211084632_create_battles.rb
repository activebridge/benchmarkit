class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.text :before
      t.text :after
      t.text :result

      t.timestamps null: false
    end
  end
end
