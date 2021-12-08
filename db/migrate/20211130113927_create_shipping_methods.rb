class CreateShippingMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_methods do |t|
      t.references :shipping_vendor, null: false , foreign_key: true
      t.references :shipping_option, null: false , foreign_key: true
      t.timestamps
    end
  end
end
