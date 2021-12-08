class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :product, null: false , foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :quantily, default: 1
      t.timestamps
    end
  end
end
