class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
    	t.references :invoice
      t.references :item
      t.integer :quantity
      t.decimal :total_price, :precision => 8, :scale => 2
      t.decimal :total_tax, :precision => 8, :scale => 2
      t.decimal :total_discount, :precision => 8, :scale => 2
      t.text :offers_applied
      t.timestamps
    end
  end
end
