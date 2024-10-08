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

ActiveRecord::Schema[7.1].define(version: 2024_09_05_142355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "color", ["red", "orange", "yellow", "green", "blue", "purple", "pink", "brown", "black", "white", "gray", "gold", "silver"]
  create_enum "cone", ["04", "5", "6", "10"]
  create_enum "photo_category", ["portrait", "landscape", "other"]

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
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

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clays", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "name", null: false
    t.string "url", null: false
    t.float "shrinkage", null: false
    t.float "absorption", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.text "api_key", null: false
    t.boolean "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_clients_on_api_key", unique: true
    t.index ["name"], name: "index_clients_on_name", unique: true
  end

  create_table "decorations", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glaze_combinations", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.enum "primary_color", null: false, enum_type: "color"
    t.bigint "first_glaze_id", null: false
    t.bigint "second_glaze_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_glaze_id"], name: "index_glaze_combinations_on_first_glaze_id"
    t.index ["second_glaze_id"], name: "index_glaze_combinations_on_second_glaze_id"
  end

  create_table "glazes", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.boolean "food_safe", null: false
    t.enum "primary_color", null: false, enum_type: "color"
    t.enum "minimum_cone", null: false, enum_type: "cone"
    t.enum "maximum_cone", null: false, enum_type: "cone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.enum "category", null: false, enum_type: "photo_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presses", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "soils", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "succulents", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terrariums", force: :cascade do |t|
    t.string "customer_name", null: false
    t.string "customer_email", null: false
    t.bigint "decoration_id"
    t.bigint "top_soil_id"
    t.bigint "bottom_soil_id"
    t.bigint "first_succulent_id"
    t.bigint "second_succulent_id"
    t.bigint "third_succulent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottom_soil_id"], name: "index_terrariums_on_bottom_soil_id"
    t.index ["decoration_id"], name: "index_terrariums_on_decoration_id"
    t.index ["first_succulent_id"], name: "index_terrariums_on_first_succulent_id"
    t.index ["second_succulent_id"], name: "index_terrariums_on_second_succulent_id"
    t.index ["third_succulent_id"], name: "index_terrariums_on_third_succulent_id"
    t.index ["top_soil_id"], name: "index_terrariums_on_top_soil_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "writings", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "glaze_combinations", "glazes", column: "first_glaze_id"
  add_foreign_key "glaze_combinations", "glazes", column: "second_glaze_id"
  add_foreign_key "terrariums", "decorations"
  add_foreign_key "terrariums", "soils", column: "bottom_soil_id"
  add_foreign_key "terrariums", "soils", column: "top_soil_id"
  add_foreign_key "terrariums", "succulents", column: "first_succulent_id"
  add_foreign_key "terrariums", "succulents", column: "second_succulent_id"
  add_foreign_key "terrariums", "succulents", column: "third_succulent_id"
end
