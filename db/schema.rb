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

ActiveRecord::Schema.define(version: 2020_05_08_120641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "car_costs", force: :cascade do |t|
    t.string "condition", null: false
    t.string "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["condition"], name: "index_car_costs_on_condition", unique: true
    t.index ["price"], name: "index_car_costs_on_price", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "kilometer_drivens", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_kilometer_drivens_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["address"], name: "index_locations_on_address"
  end

  create_table "models", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_models_on_brand_id"
    t.index ["name"], name: "index_models_on_name", unique: true
  end

  create_table "registration_states", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_registration_states_on_name", unique: true
  end

  create_table "registration_years", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_registration_years_on_name", unique: true
  end

  create_table "sellers", force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "brand_id", null: false
    t.integer "model_id", null: false
    t.integer "registration_year_id", null: false
    t.integer "registration_state_id", null: false
    t.integer "variant_id", null: false
    t.integer "kilometer_driven_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "purchase_status", default: "purchase"
    t.integer "buyer_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "phoneno", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "processing"
    t.integer "user_id"
    t.bigint "seller_id"
    t.index ["phoneno"], name: "index_tokens_on_phoneno"
    t.index ["seller_id"], name: "index_tokens_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_variants_on_name", unique: true
  end

  add_foreign_key "locations", "users"
  add_foreign_key "models", "brands"
  add_foreign_key "sellers", "brands"
  add_foreign_key "sellers", "cities"
  add_foreign_key "sellers", "kilometer_drivens"
  add_foreign_key "sellers", "models"
  add_foreign_key "sellers", "registration_states"
  add_foreign_key "sellers", "registration_years"
  add_foreign_key "sellers", "users"
  add_foreign_key "sellers", "variants"
  add_foreign_key "tokens", "sellers"
  add_foreign_key "tokens", "users"
end
