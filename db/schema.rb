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

ActiveRecord::Schema.define(version: 20170405060100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bots", force: :cascade do |t|
    t.integer  "shark_id"
    t.integer  "kind"
    t.string   "bot_id"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shark_id"], name: "index_bots_on_shark_id", using: :btree
  end

  create_table "shark_photos", force: :cascade do |t|
    t.string   "image"
    t.integer  "position"
    t.integer  "shark_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shark_id"], name: "index_shark_photos_on_shark_id", using: :btree
  end

  create_table "sharks", force: :cascade do |t|
    t.string   "name"
    t.integer  "cetacea"
    t.text     "desc"
    t.integer  "status",       default: 1
    t.text     "web_url"
    t.text     "facebook_url"
    t.text     "github_url"
    t.text     "youtube_url"
    t.string   "logo"
    t.string   "banner"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_sharks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "status",                 default: 1
    t.string   "name"
    t.string   "public_email"
    t.string   "location"
    t.text     "website"
    t.text     "bio"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bots", "sharks"
  add_foreign_key "shark_photos", "sharks"
  add_foreign_key "sharks", "users"
end
