class CreateOfferItems < ActiveRecord::Migration[5.1]
  def change
    create_table :offer_items do |t|
      t.references :offer
      t.references :item
      t.integer :discount_rate
      t.timestamps
    end
  end
end
