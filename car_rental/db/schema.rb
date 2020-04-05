# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_05_021209) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cars", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "model", limit: 25, null: false
    t.float "rank", default: 0.0
    t.float "rent", null: false
    t.boolean "automatic", null: false
    t.boolean "airconditioned", null: false
    t.integer "productionYear", null: false
    t.integer "seats", null: false
    t.text "discription"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favourites", primary_key: ["user_id", "car_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_favourites_on_car_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "rentals", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.float "cost", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_rentals_on_car_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.integer "rank", default: 0
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_reviews_on_car_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "user_name", limit: 25, null: false
    t.string "password_digest", null: false
    t.string "email", limit: 50, null: false
    t.string "name", limit: 25, null: false
    t.string "address"
    t.date "dob", null: false
    t.integer "age", null: false
    t.integer "points", default: 0
    t.boolean "admin", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favourites", "cars"
  add_foreign_key "favourites", "users"
  add_foreign_key "rentals", "cars"
  add_foreign_key "rentals", "users"
  add_foreign_key "reviews", "cars"
  add_foreign_key "reviews", "users"
end
