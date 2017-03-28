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

ActiveRecord::Schema.define(version: 20170325211612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "placelists", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_id"], name: "index_placelists_on_author_id", using: :btree
  end

  create_table "placelists_places", id: false, force: :cascade do |t|
    t.integer "placelist_id", null: false
    t.integer "place_id",     null: false
    t.index ["place_id"], name: "index_placelists_places_on_place_id", using: :btree
    t.index ["placelist_id"], name: "index_placelists_places_on_placelist_id", using: :btree
  end

  create_table "placelists_users", id: false, force: :cascade do |t|
    t.integer "user_id",      null: false
    t.integer "placelist_id", null: false
    t.index ["placelist_id"], name: "index_placelists_users_on_placelist_id", using: :btree
    t.index ["user_id"], name: "index_placelists_users_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "place_type"
    t.string   "street_address"
    t.string   "state"
    t.string   "zip_code"
    t.float    "lon"
    t.float    "lat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  create_table "places_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "place_id", null: false
    t.index ["place_id"], name: "index_places_users_on_place_id", using: :btree
    t.index ["user_id"], name: "index_places_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.index ["id"], name: "index_users_on_id", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  add_foreign_key "placelists", "users", column: "author_id"
end
