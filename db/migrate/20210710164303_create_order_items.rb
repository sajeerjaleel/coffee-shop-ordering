class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :item
      t.integer :quantity
      t.timestamps
    end
  end
end
