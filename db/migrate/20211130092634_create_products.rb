class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :author
      t.string :company
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
