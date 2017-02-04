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

ActiveRecord::Schema.define(version: 20170204044307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "conditions", force: :cascade do |t|
    t.integer "day_id"
    t.integer "max_temperature"
    t.integer "min_temperature"
    t.integer "mean_temperature"
    t.integer "mean_humidity"
    t.integer "mean_visibility"
    t.integer "mean_wind_speed"
    t.integer "precipitation"
    t.index ["day_id"], name: "index_conditions_on_day_id", using: :btree
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
  end

  create_table "stations", force: :cascade do |t|
    t.string  "name"
    t.integer "dock_count"
    t.integer "city_id"
    t.date    "installation_date"
    t.index ["city_id"], name: "index_stations_on_city_id", using: :btree
  end

  create_table "subscription_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "duration"
    t.integer "start_date_id"
    t.integer "end_date_id"
    t.integer "start_station_id"
    t.integer "end_station_id"
    t.integer "bike_id"
    t.integer "subscription_type_id"
    t.string  "zip_code"
    t.index ["subscription_type_id"], name: "index_trips_on_subscription_type_id", using: :btree
  end

  add_foreign_key "conditions", "days"
  add_foreign_key "stations", "cities"
  add_foreign_key "trips", "subscription_types"
end
