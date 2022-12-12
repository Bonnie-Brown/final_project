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

ActiveRecord::Schema[7.0].define(version: 2022_12_11_224830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.date "check_in_date"
    t.date "check_out_date"
    t.time "check_in_time"
    t.time "check_out_time"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id", null: false
    t.index ["trip_id"], name: "index_accommodations_on_trip_id"
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "todo_items", force: :cascade do |t|
    t.text "description"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "todo_list_id", null: false
    t.index ["todo_list_id"], name: "index_todo_items_on_todo_list_id"
    t.index ["user_id"], name: "index_todo_items_on_user_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.index ["trip_id"], name: "index_todo_lists_on_trip_id"
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "company_name"
    t.date "departure_date"
    t.time "check_in_time"
    t.time "arrival_time"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id", null: false
    t.index ["trip_id"], name: "index_transportations_on_trip_id"
    t.index ["user_id"], name: "index_transportations_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "departure_date"
    t.date "return_date"
    t.text "image_url"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin?", default: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "accommodations", "trips"
  add_foreign_key "accommodations", "users"
  add_foreign_key "todo_items", "todo_lists"
  add_foreign_key "todo_items", "users"
  add_foreign_key "todo_lists", "trips"
  add_foreign_key "todo_lists", "users"
  add_foreign_key "transportations", "trips"
  add_foreign_key "transportations", "users"
  add_foreign_key "trips", "users"
end
