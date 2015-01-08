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

ActiveRecord::Schema.define(version: 20150108195640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blurbs", force: true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blurbs_concepts", id: false, force: true do |t|
    t.integer "blurb_id"
    t.integer "concept_id"
  end

  create_table "blurbs_resources", id: false, force: true do |t|
    t.integer "blurb_id"
    t.integer "resource_id"
  end

  create_table "concepts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concepts_posts", id: false, force: true do |t|
    t.integer "concept_id"
    t.integer "post_id"
  end

  create_table "concepts_resources", id: false, force: true do |t|
    t.integer "concept_id"
    t.integer "resource_id"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published?"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
  end

  create_table "posts_resources", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "resource_id"
  end

  create_table "resources", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "password_digest"
  end

end
