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

ActiveRecord::Schema.define(version: 20160204062735) do

  create_table "albums", force: :cascade do |t|
    t.string   "album_name"
    t.integer  "musician_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "stage_band_name"
    t.date     "release_date"
    t.string   "record_label"
    t.string   "album_cover"
    t.integer  "language"
    t.integer  "primary_genre"
    t.integer  "secondary_genre"
  end

  add_index "albums", ["musician_id"], name: "index_albums_on_musician_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["album_id"], name: "index_order_items_on_album_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "musician_id"
    t.decimal  "total",           precision: 7, scale: 2, default: 0.0
    t.boolean  "payment_status",                          default: false
    t.boolean  "shazam",                                  default: false
    t.boolean  "youtube",                                 default: false
    t.boolean  "store_maximizer",                         default: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "orders", ["musician_id"], name: "index_orders_on_musician_id"

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "song_title"
    t.text     "lyrics"
    t.boolean  "terms"
    t.string   "audio_file"
    t.time     "duration"
    t.text     "note_to_admin"
    t.integer  "album_id"
    t.integer  "musician_id"
    t.boolean  "explicit_lyrics"
    t.boolean  "self_written"
    t.string   "original_artist"
    t.string   "original_song_title"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["musician_id"], name: "index_songs_on_musician_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "musician",               default: true
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

  create_table "wallets", force: :cascade do |t|
    t.decimal  "amount",     precision: 7, scale: 2, default: 0.0
    t.integer  "user_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id"

end
