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

ActiveRecord::Schema.define(version: 2022_06_16_134741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "hstore"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "attention"
    t.string "country"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "phone"
    t.integer "fax"
    t.integer "address_type"
    t.integer "entity_id"
    t.string "entity_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "street_1"
    t.string "street_2"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "bank_account_details", force: :cascade do |t|
    t.string "name"
    t.string "account_number"
    t.string "ifsc"
    t.string "branch"
    t.integer "entity_id"
    t.string "entity_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.text "body"
    t.uuid "client_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "features", force: :cascade do |t|
    t.boolean "is_enabled"
    t.string "menu_item_id"
    t.integer "entity_id"
    t.string "entity_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "payable_id"
    t.string "payable_type"
    t.float "paid_amount"
    t.float "balance_amount"
    t.datetime "payment_date"
    t.integer "payment_mode"
    t.integer "payment_type"
    t.string "reference"
    t.text "note"
    t.uuid "client_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pos", force: :cascade do |t|
    t.string "po_number"
    t.string "owner_name"
    t.string "vendor_name"
    t.date "date"
    t.date "expected_date"
    t.float "amount"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_invoices", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "payment_terms"
    t.string "invoice_number"
    t.string "purchase_order_number"
    t.date "invoice_date"
    t.date "payment_due_date"
    t.integer "tax_id"
    t.decimal "amount"
    t.hstore "tax_values", array: true
    t.integer "category_id"
    t.integer "gl_vendor"
    t.string "description"
    t.uuid "client_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status_id"
    t.float "total_amount"
  end

  create_table "purchase_orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "po_number"
    t.string "owner_name"
    t.string "vendor_name"
    t.date "date"
    t.date "expected_date"
    t.float "amount"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "vendor_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "entity_id"
    t.string "entity_type"
    t.uuid "client_id"
    t.uuid "user_id"
    t.integer "bill_type"
    t.string "bill"
    t.string "file_name"
    t.string "file_size"
    t.string "human_size"
  end

  create_table "vendors", force: :cascade do |t|
    t.integer "salutation"
    t.hstore "primary_contact"
    t.string "company_name"
    t.string "email"
    t.bigint "company_phone"
    t.bigint "mobile"
    t.string "designation"
    t.string "department"
    t.integer "gst_treatment"
    t.string "gst_number"
    t.integer "currency"
    t.integer "payment_terms"
    t.integer "tds"
    t.hstore "contact_persons", array: true
    t.string "pan"
    t.uuid "client_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source_of_supply"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
