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

ActiveRecord::Schema.define(version: 20130827103654) do

  create_table "experiments", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markers", force: true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "abbr"
    t.float    "scaling"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "markers", ["email"], name: "index_markers_on_email", unique: true

  create_table "sheets", force: true do |t|
    t.integer  "student_id"
    t.integer  "partner_id"
    t.integer  "experiment_id"
    t.integer  "marker_id"
    t.text     "comments"
    t.integer  "raw_mark"
    t.float    "ret_mark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mark1"
    t.integer  "mark2"
    t.integer  "mark3"
    t.integer  "mark4"
  end

  create_table "students", force: true do |t|
    t.string   "number"
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
