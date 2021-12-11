class AddToShippingIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :shipping_method, foreign_key: true,default: 1
  end
end
