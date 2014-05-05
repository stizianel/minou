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

ActiveRecord::Schema.define(version: 20140505151440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "codfisc"
    t.string   "child_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service"
  end

  create_table "timecodes", force: true do |t|
    t.string   "descr"
    t.string   "typo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timedays", force: true do |t|
    t.date     "day"
    t.integer  "code1"
    t.float    "hour1"
    t.integer  "code2"
    t.float    "hour2"
    t.integer  "code3"
    t.float    "hour3"
    t.integer  "timesheet_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cust1"
    t.integer  "cust2"
    t.integer  "cust3"
    t.float    "km1"
    t.float    "km2"
    t.float    "km3"
    t.integer  "code4"
    t.float    "hour4"
    t.integer  "cust4"
    t.float    "km4"
  end

  create_table "timesheets", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "level"
    t.string   "intext"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
