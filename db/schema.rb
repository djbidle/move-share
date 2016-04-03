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

ActiveRecord::Schema.define(version: 20160402195611) do

  create_table "resources", force: :cascade do |t|
    t.boolean  "packing"
    t.boolean  "moving"
    t.boolean  "rickshaw"
    t.boolean  "car"
    t.boolean  "van"
    t.boolean  "truck"
    t.boolean  "semi"
    t.integer  "mask"
    t.integer  "workorder_id"
    t.integer  "servicearea_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "serviceareas", force: :cascade do |t|
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "radius"
    t.integer  "move_distance"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: true
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "workorders", force: :cascade do |t|
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.string   "destination"
    t.string   "distance_text"
    t.float    "distance_value"
    t.string   "duration_text"
    t.integer  "duration_value"
    t.boolean  "is_assigned"
    t.integer  "accepted_by"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
