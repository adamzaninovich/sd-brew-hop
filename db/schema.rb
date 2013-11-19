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

ActiveRecord::Schema.define(version: 20131119023726) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "breweries", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "location"
    t.integer  "year_opened"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "hops", force: true do |t|
    t.integer  "user_id"
    t.integer  "brewery_id"
    t.string   "image"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hops", ["brewery_id"], name: "index_hops_on_brewery_id"
  add_index "hops", ["user_id"], name: "index_hops_on_user_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
