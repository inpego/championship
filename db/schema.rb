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

ActiveRecord::Schema.define(version: 2020_04_10_072413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_significatives", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "player_id"
    t.bigint "significative_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id", "player_id", "significative_id"], name: "one_significative_for_player_per_match", unique: true
    t.index ["match_id"], name: "index_match_significatives_on_match_id"
    t.index ["player_id"], name: "index_match_significatives_on_player_id"
    t.index ["significative_id"], name: "index_match_significatives_on_significative_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "team_one_id"
    t.bigint "team_two_id"
    t.string "result", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_one_id"], name: "index_matches_on_team_one_id"
    t.index ["team_two_id"], name: "index_matches_on_team_two_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "significatives", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "match_significatives", "matches"
  add_foreign_key "match_significatives", "players"
  add_foreign_key "match_significatives", "significatives"
  add_foreign_key "matches", "teams", column: "team_one_id"
  add_foreign_key "matches", "teams", column: "team_two_id"
  add_foreign_key "players", "teams"
end
