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

ActiveRecord::Schema.define(version: 2019_10_21_052303) do

  create_table "blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.string "janre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "blog_images"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_favorites_on_blog_id"
    t.index ["user_id", "blog_id"], name: "index_favorites_on_user_id_and_blog_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "introduce"
    t.string "email"
    t.string "password_digest"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "blogs"
  add_foreign_key "favorites", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
end
