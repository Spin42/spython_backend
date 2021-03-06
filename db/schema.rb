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

ActiveRecord::Schema.define(version: 20131114200635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: true do |t|
    t.string   "key",             null: false
    t.string   "type",            null: false
    t.text     "value",           null: false
    t.integer  "enrichable_id",   null: false
    t.string   "enrichable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
  end

  add_index "properties", ["enrichable_id"], name: "index_properties_on_enrichable_id", using: :btree
  add_index "properties", ["enrichable_type"], name: "index_properties_on_enrichable_type", using: :btree
  add_index "properties", ["key"], name: "index_properties_on_key", using: :btree
  add_index "properties", ["type"], name: "index_properties_on_type", using: :btree

  create_table "skins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

end
