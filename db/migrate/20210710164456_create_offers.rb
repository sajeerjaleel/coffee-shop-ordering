class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.boolean :active, default: true
      t.integer :priority_order
      t.timestamps
    end
  end
end
