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

ActiveRecord::Schema.define(version: 2021_10_31_233058) do

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
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "current_issues", "championships"
  add_foreign_key "current_phases", "championships"
end
