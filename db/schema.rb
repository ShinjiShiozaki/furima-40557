# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_17_074859) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "hassousakis", charset: "utf8", force: :cascade do |t|
    t.string "yuubin_bangou", null: false
    t.integer "todoufuken_id", null: false
    t.string "shikuchouson", null: false
    t.string "banchi", null: false
    t.string "tatemono"
    t.string "denwabango", null: false
    t.bigint "kounyuu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kounyuu_id"], name: "index_hassousakis_on_kounyuu_id"
  end

  create_table "items", charset: "utf8", force: :cascade do |t|
    t.string "mei", null: false
    t.text "setsumei", null: false
    t.integer "category_id", null: false
    t.integer "jyoutai_id", null: false
    t.integer "haisouryou_futan_id", null: false
    t.integer "todoufuken_id", null: false
    t.integer "hassou_nissuu_id", null: false
    t.integer "kakaku", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "kounyuus", charset: "utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_kounyuus_on_item_id"
    t.index ["user_id"], name: "index_kounyuus_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nick_name", null: false
    t.string "sei_kanji", null: false
    t.string "mei_kanji", null: false
    t.string "sei_kana", null: false
    t.string "mei_kana", null: false
    t.date "tanjyoubi", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "hassousakis", "kounyuus"
  add_foreign_key "items", "users"
  add_foreign_key "kounyuus", "items"
  add_foreign_key "kounyuus", "users"
end
