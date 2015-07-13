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

ActiveRecord::Schema.define(version: 20150713094444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "beds", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "room_id"
    t.uuid     "patient_id"
    t.string   "identifier", limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "beds", ["identifier"], name: "index_beds_on_identifier", unique: true, using: :btree
  add_index "beds", ["patient_id"], name: "index_beds_on_patient_id", using: :btree
  add_index "beds", ["room_id"], name: "index_beds_on_room_id", using: :btree

  create_table "patients", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "identifier",   limit: 50
    t.string   "patient_type"
    t.string   "first_name",   limit: 50
    t.string   "last_name",    limit: 50
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "patients", ["identifier"], name: "index_patients_on_identifier", unique: true, using: :btree

  create_table "rooms", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid    "ward_id"
    t.string  "identifier", limit: 50
    t.integer "beds_count",            default: 0
  end

  add_index "rooms", ["identifier"], name: "index_rooms_on_identifier", unique: true, using: :btree
  add_index "rooms", ["ward_id"], name: "index_rooms_on_ward_id", using: :btree

  create_table "wards", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "identifier", limit: 50
    t.string   "ward_type"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "wards", ["identifier"], name: "index_wards_on_identifier", unique: true, using: :btree

end
