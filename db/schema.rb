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

ActiveRecord::Schema.define(version: 20161203192058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beacons", force: :cascade do |t|
    t.string   "name",            null: false
    t.integer  "major_region_id", null: false
    t.integer  "minor_region_id", null: false
    t.integer  "user_id",         null: false
    t.text     "description"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "beacons", ["major_region_id", "minor_region_id"], name: "index_beacons_on_major_region_id_and_minor_region_id", unique: true, using: :btree

  create_table "devices", id: false, force: :cascade do |t|
    t.string   "device_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "devices", ["device_id"], name: "index_devices_on_device_id", unique: true, using: :btree

  create_table "discovers", force: :cascade do |t|
    t.string   "device_id",     null: false
    t.integer  "major_id",      null: false
    t.integer  "minor_id",      null: false
    t.string   "discover_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "major_regions", id: false, force: :cascade do |t|
    t.integer  "major_id",    null: false
    t.integer  "user_id",     null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "major_regions", ["major_id"], name: "index_major_regions_on_major_id", unique: true, using: :btree

  create_table "minor_regions", id: false, force: :cascade do |t|
    t.integer  "minor_id",    null: false
    t.integer  "user_id",     null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "minor_regions", ["minor_id"], name: "index_minor_regions_on_minor_id", unique: true, using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: :cascade do |t|
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
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true, using: :btree
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true, using: :btree

end
