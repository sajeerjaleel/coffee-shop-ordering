class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.datetime :completed_at
      t.integer :total_items
      t.timestamps
    end
  end
end
