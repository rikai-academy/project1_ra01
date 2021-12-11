# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_09_025807) do

  create_table "order_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantily", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.integer "status_order"
    t.float "tax"
    t.string "promo"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "province"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shipping_method_id", default: 1
    t.index ["shipping_method_id"], name: "index_orders_on_shipping_method_id"
  end

  create_table "product_categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "author"
    t.string "company"
    t.float "price"
    t.float "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_category_id", null: false
    t.integer "user_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "shipping_methods", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "shipping_vendor_id", null: false
    t.bigint "shipping_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_option_id"], name: "index_shipping_methods_on_shipping_option_id"
    t.index ["shipping_vendor_id"], name: "index_shipping_methods_on_shipping_vendor_id"
  end

  create_table "shipping_options", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shipping_vendors", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.bigint "shipping_warehouse_id", null: false
    t.string "phone"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_warehouse_id"], name: "index_shipping_vendors_on_shipping_warehouse_id"
  end

  create_table "shipping_warehouses", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "shipping_methods"
  add_foreign_key "products", "product_categories"
  add_foreign_key "shipping_methods", "shipping_options"
  add_foreign_key "shipping_methods", "shipping_vendors"
  add_foreign_key "shipping_vendors", "shipping_warehouses"
end
