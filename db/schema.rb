# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151005005505) do

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "divisions", ["league_id"], name: "index_divisions_on_league_id"
  add_index "divisions", ["region_id"], name: "index_divisions_on_region_id"

  create_table "games", force: :cascade do |t|
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["match_id"], name: "index_games_on_match_id"

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "match_status_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "matches", ["away_team_id"], name: "index_matches_on_away_team_id"
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id"
  add_index "matches", ["match_status_id"], name: "index_matches_on_match_status_id"

  create_table "memberships", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["player_id"], name: "index_memberships_on_player_id"
  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id"

  create_table "performances", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "saves"
    t.integer  "shots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "performances", ["game_id"], name: "index_performances_on_game_id"
  add_index "performances", ["player_id"], name: "index_performances_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "username"
    t.string   "psn_id"
    t.string   "steam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.integer  "division_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "seasons", ["division_id"], name: "index_seasons_on_division_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["season_id"], name: "index_teams_on_season_id"

end
