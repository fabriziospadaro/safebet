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

ActiveRecord::Schema.define(version: 2018_07_12_151955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bet_id"
    t.bigint "parlay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bet_id"], name: "index_bet_users_on_bet_id"
    t.index ["parlay_id"], name: "index_bet_users_on_parlay_id"
    t.index ["user_id"], name: "index_bet_users_on_user_id"
  end

  create_table "bets", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bets_on_event_id"
    t.index ["team_id"], name: "index_bets_on_team_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "odds"
    t.integer "team_a_id"
    t.integer "team_b_id"
    t.integer "winner_id"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "league"
    t.string "status"
    t.string "scraped_score"
    t.integer "team_a_score"
    t.integer "team_b_score"
    t.string "unique_event_id"
    t.datetime "starts_at"
    t.string "time"
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "parlays", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prize", default: 0
    t.boolean "withdrawn", default: false
    t.index ["user_id"], name: "index_parlays_on_user_id"
  end

  create_table "payouts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "parlay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.index ["parlay_id"], name: "index_payouts_on_parlay_id"
    t.index ["user_id"], name: "index_payouts_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "leagues"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bet_users", "bets"
  add_foreign_key "bet_users", "parlays"
  add_foreign_key "bet_users", "users"
  add_foreign_key "bets", "events"
  add_foreign_key "bets", "teams"
  add_foreign_key "events", "sports"
  add_foreign_key "parlays", "users"
  add_foreign_key "payouts", "parlays"
  add_foreign_key "payouts", "users"
end
