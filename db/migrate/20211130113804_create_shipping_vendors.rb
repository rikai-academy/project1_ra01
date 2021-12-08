class CreateShippingVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_vendors do |t|
      t.string :name
      t.string :city
      t.references :shipping_warehouse, null: false , foreign_key: true
      t.string :phone
      t.string :url
      t.timestamps
    end
  end
end
