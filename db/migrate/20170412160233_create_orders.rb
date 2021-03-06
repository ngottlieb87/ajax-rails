class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.decimal :total_price
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
