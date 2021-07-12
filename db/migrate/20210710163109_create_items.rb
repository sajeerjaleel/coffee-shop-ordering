class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.references :category
      t.decimal :price, :precision => 8, :scale => 2
      t.float :tax_rate
      t.text :description
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
