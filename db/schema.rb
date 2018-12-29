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

ActiveRecord::Schema.define(version: 2018_12_27_155538) do

  create_table "art_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 30, null: false
  end

  create_table "creators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", limit: 30, null: false
    t.bigint "art_category_id", null: false
    t.integer "establishment", null: false
    t.integer "employee", null: false
    t.string "postal_code", limit: 7, null: false
    t.string "address_1", limit: 50, null: false
    t.string "address_2", limit: 50, null: false
    t.text "introduction"
    t.boolean "is_recruitment", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["art_category_id"], name: "index_creators_on_art_category_id"
    t.index ["user_id"], name: "index_creators_on_user_id"
  end

  create_table "diaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "content", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "diary_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "user_id", null: false
    t.string "comment", limit: 100, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "deleted_at"
    t.index ["diary_id"], name: "index_diary_comments_on_diary_id"
    t.index ["user_id"], name: "index_diary_comments_on_user_id"
  end

  create_table "diary_goods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "user_id", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["diary_id"], name: "index_diary_goods_on_diary_id"
    t.index ["user_id"], name: "index_diary_goods_on_user_id"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "favorite_user_id", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["favorite_user_id"], name: "index_favorites_on_favorite_user_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "galleries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "data", null: false
    t.string "comment", limit: 100, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "deleted_at"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "heirs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "art_category_id", null: false
    t.text "introduction"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
    t.index ["art_category_id"], name: "index_heirs_on_art_category_id"
    t.index ["user_id"], name: "index_heirs_on_user_id"
  end

  create_table "inquiries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "inquiry_category_id", null: false
    t.text "content", null: false
    t.boolean "is_check", default: false, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["inquiry_category_id"], name: "index_inquiries_on_inquiry_category_id"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "inquiry_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "target_user_id", null: false
    t.boolean "is_scout", null: false
    t.boolean "is_ok"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
    t.index ["target_user_id"], name: "index_matches_on_target_user_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "send_user_id", null: false
    t.bigint "receive_user_id", null: false
    t.text "content", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["receive_user_id"], name: "index_messages_on_receive_user_id"
    t.index ["send_user_id"], name: "index_messages_on_send_user_id"
  end

  create_table "taggings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "password_digest", null: false
    t.string "name", limit: 50, null: false
    t.string "email", limit: 256, null: false
    t.text "profile"
    t.string "avatar_path"
    t.boolean "is_creator", default: false, null: false
    t.date "birthday", null: false
    t.boolean "is_man", null: false
    t.boolean "is_certification", default: false, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "login_time"
    t.timestamp "deleted_at"
  end

  add_foreign_key "creators", "art_categories"
  add_foreign_key "creators", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "diary_comments", "diaries", on_delete: :cascade
  add_foreign_key "diary_comments", "users"
  add_foreign_key "diary_goods", "diaries", on_delete: :cascade
  add_foreign_key "diary_goods", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "users", column: "favorite_user_id"
  add_foreign_key "galleries", "users"
  add_foreign_key "heirs", "art_categories"
  add_foreign_key "heirs", "users"
  add_foreign_key "inquiries", "inquiry_categories"
  add_foreign_key "inquiries", "users"
  add_foreign_key "matches", "users"
  add_foreign_key "matches", "users", column: "target_user_id"
  add_foreign_key "messages", "users", column: "receive_user_id"
  add_foreign_key "messages", "users", column: "send_user_id"
end
