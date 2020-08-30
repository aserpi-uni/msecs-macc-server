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

ActiveRecord::Schema.define(version: 2020_08_29_145628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_clients_on_name", unique: true
  end

  create_table "clients_workspaces", id: false, force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "workspace_id", null: false
    t.index ["client_id", "workspace_id"], name: "index_clients_workspaces_on_client_id_and_workspace_id"
    t.index ["workspace_id", "client_id"], name: "index_clients_workspaces_on_workspace_id_and_client_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "workspace_name"
    t.date "delivery_time"
    t.float "current_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.bigint "admin_id", null: false
    t.string "status"
    t.string "currency"
    t.index ["admin_id"], name: "index_projects_on_admin_id"
  end

  create_table "worker_authentication_tokens", force: :cascade do |t|
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "last_used_at"
    t.integer "expires_in"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body"], name: "index_worker_authentication_tokens_on_body"
    t.index ["user_id"], name: "index_worker_authentication_tokens_on_user_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "email"
    t.integer "bill_rate_cents"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
  end

  create_table "workers_workspaces", id: false, force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "workspace_id", null: false
    t.index ["worker_id", "workspace_id"], name: "index_workers_workspaces_on_worker_id_and_workspace_id"
    t.index ["workspace_id", "worker_id"], name: "index_workers_workspaces_on_workspace_id_and_worker_id"
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.bigint "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_workspaces_on_admin_id"
    t.index ["name"], name: "index_workspaces_on_name", unique: true
  end

  add_foreign_key "projects", "admins"
  add_foreign_key "worker_authentication_tokens", "workers", column: "user_id"
  add_foreign_key "workspaces", "admins"
end
