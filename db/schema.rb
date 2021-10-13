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

ActiveRecord::Schema.define(version: 2021_10_11_055912) do

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "popular_name"
    t.string "status"
    t.string "championship_type"
    t.string "logo"
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "championships_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "championship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["championship_id", "user_id"], name: "index_championships_users_on_championship_id_and_user_id", unique: true
    t.index ["championship_id"], name: "index_championships_users_on_championship_id"
    t.index ["user_id", "championship_id"], name: "index_championships_users_on_user_id_and_championship_id", unique: true
    t.index ["user_id"], name: "index_championships_users_on_user_id"
  end

  create_table "current_issues", force: :cascade do |t|
    t.string "season"
    t.string "name"
    t.string "popular_name"
    t.string "slug"
    t.integer "championship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["championship_id"], name: "index_current_issues_on_championship_id"
  end

  create_table "current_phases", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "phase_type"
    t.integer "championship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["championship_id"], name: "index_current_phases_on_championship_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "championships_users", "championships"
  add_foreign_key "championships_users", "users"
  add_foreign_key "current_issues", "championships"
  add_foreign_key "current_phases", "championships"
end
