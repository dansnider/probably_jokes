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

ActiveRecord::Schema.define(version: 20160209023301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comedians", force: :cascade do |t|
    t.string   "id_str"
    t.string   "name"
    t.string   "screen_name"
    t.string   "url"
    t.string   "profile_image_url"
    t.string   "followers_count"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.integer  "comedian_id"
    t.text     "text"
    t.string   "retweet_count"
    t.string   "favorite_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "comedian_name"
    t.string   "comedian_screen_name"
    t.string   "comedian_url"
    t.string   "comedian_image_url"
    t.string   "media"
    t.string   "media_type"
    t.integer  "user_score"
  end

  add_index "tweets", ["comedian_id"], name: "index_tweets_on_comedian_id", using: :btree

  add_foreign_key "tweets", "comedians"
end
