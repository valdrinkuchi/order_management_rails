# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_21_115303) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_brands_on_customer_id"
  end

  create_table "calculations", force: :cascade do |t|
    t.integer "production_id", null: false
    t.float "sale_neto"
    t.float "sale_vat"
    t.float "sale_gross"
    t.float "buy_neto"
    t.float "buy_bonus"
    t.float "buy_gross"
    t.float "profit"
    t.integer "days_late"
    t.float "amount_difference"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["production_id"], name: "index_calculations_on_production_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "short_name"
    t.string "address"
    t.string "delivery_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "brand_id", null: false
    t.integer "number"
    t.float "price"
    t.date "signed"
    t.date "due"
    t.boolean "in_production", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "count"
    t.index ["brand_id"], name: "index_orders_on_brand_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "producers", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "short_name"
    t.string "address"
    t.float "bonus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "productions", force: :cascade do |t|
    t.integer "load_count"
    t.float "price"
    t.date "load_date"
    t.float "bonus", default: 4.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order_id", null: false
    t.integer "producer_id", null: false
    t.index ["order_id"], name: "index_productions_on_order_id"
    t.index ["producer_id"], name: "index_productions_on_producer_id"
  end

  add_foreign_key "brands", "customers"
  add_foreign_key "calculations", "productions"
  add_foreign_key "orders", "brands"
  add_foreign_key "orders", "customers"
  add_foreign_key "productions", "orders"
end
