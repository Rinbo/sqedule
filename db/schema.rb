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

ActiveRecord::Schema.define(version: 2018_11_09_121332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patterns", force: :cascade do |t|
    t.time "shift_start"
    t.integer "shift_length"
    t.integer "break_length"
    t.boolean "cleaning", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_patterns_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.date "date"
    t.bigint "pattern_id"
    t.boolean "cleaning", default: false
    t.integer "staff_req"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_shifts_on_pattern_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.boolean "cleaning", default: false
    t.date "employment_end"
    t.integer "shift_preference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "patterns", "users"
  add_foreign_key "shifts", "patterns"
end
