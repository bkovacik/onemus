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

ActiveRecord::Schema.define(version: 20160906144112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_positions", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "card_id"
    t.integer  "zone_id"
    t.integer  "location_x"
    t.integer  "location_y"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "type_id"
    t.string   "name"
    t.string   "cost"
    t.string   "race"
    t.string   "profession"
    t.string   "ability"
    t.json     "j_ability"
    t.integer  "atk"
    t.integer  "hp"
    t.integer  "atk_mod"
    t.integer  "hit_mod"
    t.integer  "ev_mod"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards_chroma", id: false, force: :cascade do |t|
    t.integer "card_id"
    t.integer "chroma_id"
  end

  create_table "chroma", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "phase_id"
    t.integer  "turn_player_id"
    t.integer  "room_id"
    t.integer  "turn"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "card_access",     default: false, null: false
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_rooms", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "card_positions", "cards"
  add_foreign_key "card_positions", "players"
  add_foreign_key "card_positions", "zones"
  add_foreign_key "cards", "types"
  add_foreign_key "cards_chroma", "cards"
  add_foreign_key "cards_chroma", "chroma"
  add_foreign_key "games", "phases"
  add_foreign_key "games", "players", column: "turn_player_id"
  add_foreign_key "games", "rooms"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
  add_foreign_key "rooms", "games"
  add_foreign_key "users", "players"
  add_foreign_key "users_rooms", "rooms"
  add_foreign_key "users_rooms", "users"
end
