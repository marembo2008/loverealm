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

ActiveRecord::Schema.define(version: 20140316212232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "basic_credentials", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.integer  "reply_to_id"
    t.integer  "artcile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likearticles", force: true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likecomments", force: true do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likestatuses", force: true do |t|
    t.integer  "status_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "url"
    t.string   "image"
    t.integer  "user_id"
    t.string   "title"
    t.text     "subtitle"
    t.text     "content"
    t.integer  "is_draft"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "read_articles", force: true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "read_laters", force: true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reported_users", force: true do |t|
    t.integer  "reporter_id"
    t.integer  "reportee_id"
    t.text     "reason"
    t.integer  "content_id"
    t.integer  "content_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_updates", force: true do |t|
    t.integer  "uid"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.text     "content"
    t.integer  "read_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.date     "birthday"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "avatar"
    t.boolean  "validated"
    t.string   "validation_code"
    t.string   "emailsecret"
    t.string   "secretcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
