class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
    	t.references :order
      t.integer :status, default: 0
      t.datetime :time
      t.integer :total_items
      t.decimal :total_discount, :precision => 8, :scale => 2
      t.decimal :total_tax, :precision => 8, :scale => 2
      t.decimal :total_amount, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
