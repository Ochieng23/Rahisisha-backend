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

ActiveRecord::Schema[7.0].define(version: 2023_04_19_091422) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "admins", force: :cascade do |t|
    t.string "admin_code"
    t.string "full_name"
    t.string "email"
    t.string "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_code"], name: "index_admins_on_admin_code", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment_code"
    t.string "content"
    t.string "post_code"
    t.string "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_code"], name: "index_comments_on_comment_code", unique: true
  end

  create_table "employers", force: :cascade do |t|
    t.string "employer_code"
    t.string "company_name"
    t.string "email"
    t.string "location"
    t.string "avatar"
    t.string "description"
    t.boolean "verified"
    t.string "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_code"], name: "index_employers_on_employer_code", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_code"
    t.string "job_name"
    t.string "description"
    t.string "employer_code"
    t.string "jobtag_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_code"], name: "index_jobs_on_job_code", unique: true
  end

  create_table "jobtags", force: :cascade do |t|
    t.string "jobtag_code"
    t.string "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jobtag_code"], name: "index_jobtags_on_jobtag_code", unique: true
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "post_code", limit: 255, null: false
    t.string "title", limit: 255, null: false
    t.string "media", limit: 255
    t.text "description", null: false
    t.integer "likes", null: false
    t.string "user_code", limit: 255, null: false
    t.datetime "created_at", precision: nil, default: -> { "now()" }
    t.datetime "updated_at", precision: nil, default: -> { "now()" }
    t.index ["post_code"], name: "index_posts_on_post_code", unique: true
    t.index ["post_code"], name: "posts_post_code_key", unique: true
  end

  create_table "seekers", force: :cascade do |t|
    t.string "seeker_code"
    t.string "full_name"
    t.string "email"
    t.string "location"
    t.string "gender"
    t.string "date_of_birth"
    t.string "avatar"
    t.string "phone_number"
    t.string "preferred_job"
    t.string "availability"
    t.integer "minimum_salary"
    t.boolean "verified"
    t.string "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seeker_code"], name: "index_seekers_on_seeker_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "user_code"
    t.string "username"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_code"], name: "index_users_on_user_code", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
