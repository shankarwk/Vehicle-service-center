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

ActiveRecord::Schema[7.0].define(version: 2022_10_13_161502) do
  create_table "category_lists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.decimal "cost", precision: 10
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "vehicle_number"
    t.string "contact_number"
    t.bigint "service_center_id", null: false
    t.string "status", default: "not booked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "category"
    t.string "cost"
    t.string "confirm_time"
    t.string "confirm_date"
    t.string "confirm_slot"
    t.string "request_date"
    t.string "request_time"
    t.string "category_time"
    t.string "next_date"
    t.index ["service_center_id"], name: "index_clients_on_service_center_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id", null: false
    t.bigint "service_center_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_center_id"], name: "index_payments_on_service_center_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "service_centers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "shop_name"
    t.string "shop_owner"
    t.string "location"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_service_centers_on_user_id"
  end

  create_table "service_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.decimal "cost", precision: 10
    t.bigint "service_center_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time"
    t.index ["service_center_id"], name: "index_service_types_on_service_center_id"
  end

  create_table "services", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.bigint "service_center_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_center_id"], name: "index_services_on_service_center_id"
  end

  create_table "slots", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "status", default: "available"
    t.string "name"
    t.bigint "service_center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_center_id"], name: "index_slots_on_service_center_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_rule", default: "user"
    t.string "stripe_customer_id"
    t.integer "membership", default: 0
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "service_centers"
  add_foreign_key "clients", "users"
  add_foreign_key "payments", "service_centers"
  add_foreign_key "payments", "users"
  add_foreign_key "service_centers", "users"
  add_foreign_key "service_types", "service_centers"
  add_foreign_key "services", "service_centers"
end
