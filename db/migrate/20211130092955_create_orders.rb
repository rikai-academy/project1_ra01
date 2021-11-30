class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status_order
      t.float :tax
      t.string :promo
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :province
      t.string :country

      t.timestamps
    end
  end
end
