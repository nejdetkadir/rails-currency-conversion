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

ActiveRecord::Schema.define(version: 2021_12_10_234944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversions", force: :cascade do |t|
    t.bigint "currency_id", null: false
    t.bigint "to_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_conversions_on_currency_id"
    t.index ["to_id"], name: "index_conversions_on_to_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "iso_code", null: false
    t.decimal "rate", null: false
    t.boolean "is_base", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iso_code"], name: "index_currencies_on_iso_code", unique: true
  end

  add_foreign_key "conversions", "currencies"
  add_foreign_key "conversions", "currencies", column: "to_id"
end
