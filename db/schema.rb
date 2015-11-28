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

ActiveRecord::Schema.define(version: 20151128181229) do

  create_table "badges", force: :cascade do |t|
    t.string   "issuer_url",          limit: 255
    t.string   "issuer_organization", limit: 255
    t.string   "earner_email",        limit: 255
    t.string   "name",                limit: 255
    t.string   "description",         limit: 255
    t.string   "img_url",             limit: 255
    t.date     "issued_on"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "xp",         limit: 4
    t.integer  "gold",       limit: 4
    t.string   "hair",       limit: 255
    t.string   "skin",       limit: 255
    t.string   "shirt",      limit: 255
    t.string   "pants",      limit: 255
    t.integer  "User_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "level",      limit: 4
    t.string   "helmet",     limit: 255
    t.string   "armor",      limit: 255
    t.string   "shield",     limit: 255
    t.string   "weapon",     limit: 255
    t.integer  "correct",    limit: 4
    t.integer  "wrong",      limit: 4
  end

  add_index "characters", ["User_id"], name: "index_characters_on_User_id", using: :btree

  create_table "done_lessons", force: :cascade do |t|
    t.integer  "Lesson_id",    limit: 4
    t.integer  "Character_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "score",        limit: 4
  end

  add_index "done_lessons", ["Character_id"], name: "index_done_lessons_on_Character_id", using: :btree
  add_index "done_lessons", ["Lesson_id"], name: "index_done_lessons_on_Lesson_id", using: :btree

  create_table "inventories", force: :cascade do |t|
    t.integer  "User_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "inventories", ["User_id"], name: "index_inventories_on_User_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "img",        limit: 255
    t.integer  "price",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "part",       limit: 255
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "url",        limit: 255
    t.string   "subject",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "line_badges", force: :cascade do |t|
    t.integer  "badge_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "line_badges", ["badge_id"], name: "index_line_badges_on_badge_id", using: :btree
  add_index "line_badges", ["user_id"], name: "index_line_badges_on_user_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "Item_id",      limit: 4
    t.integer  "Inventory_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "line_items", ["Inventory_id"], name: "index_line_items_on_Inventory_id", using: :btree
  add_index "line_items", ["Item_id"], name: "index_line_items_on_Item_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "lesson",     limit: 255
    t.text     "statement",  limit: 65535
    t.string   "a",          limit: 255
    t.string   "b",          limit: 255
    t.string   "c",          limit: 255
    t.string   "d",          limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "admin",                  limit: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "line_badges", "badges"
  add_foreign_key "line_badges", "users"
end
