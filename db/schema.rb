# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_10_181304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "pnr"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.integer "user_id"
    t.integer "first_id"
    t.integer "business_id"
    t.integer "economy_id"
    t.boolean "booked", default: false
  end

  create_table "businesses", force: :cascade do |t|
    t.integer "row"
    t.integer "seats_in_row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.integer "business_price"
    t.integer "num_of_seats"
  end

  create_table "economies", force: :cascade do |t|
    t.integer "row"
    t.integer "seats_in_row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.integer "economy_price"
    t.integer "num_of_seats"
  end

  create_table "firsts", force: :cascade do |t|
    t.integer "row"
    t.integer "seats_in_row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.integer "first_price"
    t.integer "num_of_seats"
  end

  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.string "ftype"
    t.string "from"
    t.string "destination"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "base_price"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "class_id"
    t.string "spnr"
    t.string "class_pnr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "first_id"
    t.integer "business_id"
    t.integer "economy_id"
    t.boolean "available", default: true
    t.integer "seat_price"
    t.integer "booking_id"
    t.integer "seatno"
  end

  create_table "selectseats", force: :cascade do |t|
    t.integer "seatnumber"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_selectseats_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "selectseats", "bookings"
end
