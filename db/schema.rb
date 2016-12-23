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

ActiveRecord::Schema.define(version: 20161219025827) do

  create_table "album_addons", force: :cascade do |t|
    t.integer  "album_id"
    t.boolean  "youtube"
    t.boolean  "shazam"
    t.boolean  "store_maximizer"
    t.integer  "renewal_status"
    t.date     "start_date"
    t.date     "next_renewal_date"
    t.integer  "number_of_times_renewed", default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string   "album_name"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "stage_band_name"
    t.date     "release_date"
    t.string   "record_label"
    t.string   "album_cover"
    t.integer  "language"
    t.integer  "primary_genre"
    t.integer  "secondary_genre"
    t.string   "spotify"
    t.string   "itunes"
    t.string   "apple_music"
    t.string   "google_play"
    t.string   "amazon"
    t.string   "r_dio"
    t.string   "deezer"
    t.string   "tidal"
    t.string   "youtube"
    t.string   "microsoft_groove"
    t.string   "media_net"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id"

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "open_status"
    t.decimal  "share",       precision: 8, scale: 5
    t.decimal  "amount",      precision: 7, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "bid_price",   precision: 7, scale: 2
  end

  add_index "bids", ["song_id"], name: "index_bids_on_song_id"
  add_index "bids", ["user_id"], name: "index_bids_on_user_id"

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "renewal_status"
    t.date     "start_date"
    t.date     "next_renewal_date"
    t.integer  "number_of_times_renewed", default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "open_status"
    t.decimal  "share",       precision: 8, scale: 5
    t.decimal  "amount",      precision: 7, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "offer_price", precision: 7, scale: 2
  end

  add_index "offers", ["song_id"], name: "index_offers_on_song_id"
  add_index "offers", ["user_id"], name: "index_offers_on_user_id"

  create_table "payments", force: :cascade do |t|
    t.string   "express_token"
    t.string   "express_payer_id"
    t.integer  "wallet_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "transaction_log_id"
    t.string   "paypal_id"
    t.integer  "payment_type",       default: 1, null: false
    t.text     "details"
  end

  create_table "shareholders", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.decimal  "share",      precision: 8, scale: 5
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "shareholders", ["song_id"], name: "index_shareholders_on_song_id"
  add_index "shareholders", ["user_id"], name: "index_shareholders_on_user_id"

  create_table "shortlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_stats", force: :cascade do |t|
    t.date     "reporting_date"
    t.string   "sale_month"
    t.string   "store"
    t.string   "artist"
    t.string   "title"
    t.integer  "quantity"
    t.string   "song_album"
    t.decimal  "customer_paid",                 precision: 7, scale: 2
    t.string   "customer_currency"
    t.string   "country_of_sale"
    t.string   "songwriter_royalties_withheld"
    t.decimal  "earnings",                      precision: 7, scale: 2
    t.integer  "song_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "song_title"
    t.text     "lyrics"
    t.boolean  "terms"
    t.string   "audio_file"
    t.time     "duration"
    t.text     "note_to_admin"
    t.integer  "album_id"
    t.integer  "user_id"
    t.boolean  "explicit_lyrics"
    t.boolean  "self_written"
    t.string   "original_artist"
    t.string   "original_song_title"
    t.string   "spotify"
    t.string   "itunes"
    t.string   "apple_music"
    t.string   "google_play"
    t.string   "amazon"
    t.string   "r_dio"
    t.string   "deezer"
    t.string   "tidal"
    t.string   "youtube"
    t.string   "microsoft_groove"
    t.string   "media_net"
    t.string   "producer"
    t.string   "producer_email"
    t.integer  "view_count"
    t.integer  "download_count"
    t.decimal  "income_till_date",    precision: 7, scale: 2
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["user_id"], name: "index_songs_on_user_id"

  create_table "subscription_items", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "subscription_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "itemable_id"
    t.string   "itemable_type"
  end

  add_index "subscription_items", ["album_id"], name: "index_subscription_items_on_album_id"
  add_index "subscription_items", ["itemable_type", "itemable_id"], name: "index_subscription_items_on_itemable_type_and_itemable_id"
  add_index "subscription_items", ["subscription_id"], name: "index_subscription_items_on_subscription_id"

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total",              precision: 7, scale: 2, default: 0.0
    t.boolean  "payment_status",                             default: false
    t.boolean  "shazam",                                     default: false
    t.boolean  "youtube",                                    default: false
    t.boolean  "store_maximizer",                            default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "transaction_log_id"
    t.integer  "subscription_type"
  end

  add_index "subscriptions", ["transaction_log_id"], name: "index_subscriptions_on_transaction_log_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "trade_logs", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "song_id"
    t.decimal  "share",              precision: 8, scale: 5
    t.decimal  "amount",             precision: 7, scale: 2
    t.integer  "transaction_log_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "trade_logs", ["buyer_id"], name: "index_trade_logs_on_buyer_id"
  add_index "trade_logs", ["seller_id"], name: "index_trade_logs_on_seller_id"
  add_index "trade_logs", ["song_id"], name: "index_trade_logs_on_song_id"

  create_table "transaction_logs", force: :cascade do |t|
    t.integer  "transaction_type"
    t.decimal  "amount",             precision: 7, scale: 2
    t.integer  "transaction_status"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "user_id"
    t.integer  "transactable_id"
    t.string   "transactable_type"
  end

  add_index "transaction_logs", ["transactable_type", "transactable_id"], name: "index_transaction_logs_on_transactable_type_n_transactable_id"
  add_index "transaction_logs", ["user_id"], name: "index_transaction_logs_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
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
    t.boolean  "musician",               default: false
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.string   "profile_photo"
    t.string   "stage_name"
    t.string   "hometown"
    t.string   "country"
    t.string   "facebook"
    t.string   "soundcloud"
    t.string   "youtube"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "wallets", force: :cascade do |t|
    t.decimal  "amount",     precision: 7, scale: 2, default: 0.0
    t.integer  "user_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id"

end
