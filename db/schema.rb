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

ActiveRecord::Schema.define(version: 2021_04_12_001808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exam_users", force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_exam_users_on_exam_id"
    t.index ["user_id"], name: "index_exam_users_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "college_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_id"], name: "index_exams_on_college_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["last_name", "first_name", "phone_number"], name: "index_users_on_last_name_and_first_name_and_phone_number", unique: true
  end

  add_foreign_key "exam_users", "exams"
  add_foreign_key "exam_users", "users"
  add_foreign_key "exams", "colleges"
end
