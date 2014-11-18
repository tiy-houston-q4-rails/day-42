class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :bread
      t.string :meat
      t.boolean :pickles, default: false
      t.boolean :made, default: false

      t.timestamps
    end
  end
end
