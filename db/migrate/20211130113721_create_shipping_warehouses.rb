class CreateShippingWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_warehouses do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.timestamps
    end
  end
end
