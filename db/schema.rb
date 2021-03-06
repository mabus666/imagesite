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

ActiveRecord::Schema.define(version: 20140315183905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: true do |t|
    t.integer  "menu_id"
    t.integer  "menuable_id"
    t.string   "menuable_type"
    t.string   "name"
    t.string   "description"
    t.boolean  "new_page"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "url"
  end

  add_index "menu_items", ["ancestry"], name: "index_menu_items_on_ancestry", using: :btree
  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree
  add_index "menu_items", ["position"], name: "index_menu_items_on_position", using: :btree

  create_table "menus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "page_items", force: true do |t|
    t.integer  "position"
    t.integer  "page_id"
    t.integer  "pageable_id"
    t.string   "pageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.boolean  "gallery"
    t.string   "title"
    t.text     "description"
    t.string   "item_class"
    t.string   "item_link"
    t.boolean  "item_link_boolean"
  end

  add_index "page_items", ["page_id"], name: "index_page_items_on_page_id", using: :btree
  add_index "page_items", ["pageable_id", "pageable_type"], name: "index_page_items_on_pageable_id_and_pageable_type", using: :btree

  create_table "page_titles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "excerpt"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
    t.string   "second_title"
    t.string   "template"
  end

  add_index "pages", ["photo_id"], name: "index_pages_on_photo_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "public_themes", force: true do |t|
    t.string   "name"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["photo_id"], name: "index_taggings_on_photo_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", force: true do |t|
    t.string   "name"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "themes", ["user_id"], name: "index_themes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "auth_token"
    t.string   "username"
    t.integer  "theme_id"
    t.string   "site_title"
    t.string   "site_tagline"
    t.string   "alias_domain"
    t.integer  "home_id"
    t.string   "home_type"
  end

  add_index "users", ["theme_id"], name: "index_users_on_theme_id", using: :btree

end
