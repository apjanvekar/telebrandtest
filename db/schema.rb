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

ActiveRecord::Schema.define(version: 20151218121320) do

  create_table "branches", force: :cascade do |t|
    t.string   "branch_name", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_name", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "employee_masters", force: :cascade do |t|
    t.string   "emp_code",           limit: 255
    t.string   "first_name",         limit: 255
    t.string   "middle_name",        limit: 255
    t.string   "last_name",          limit: 255
    t.date     "date_of_join"
    t.boolean  "gender",             limit: 1
    t.date     "leave_start_date"
    t.date     "leave_end_date"
    t.integer  "yearly_alocated_sl", limit: 4
    t.integer  "yearly_alocated_pl", limit: 4
    t.integer  "yearly_alocated_cl", limit: 4
    t.integer  "group_id",           limit: 4
    t.integer  "branch_id",          limit: 4
    t.integer  "unit_id",            limit: 4
    t.integer  "department_id",      limit: 4
    t.integer  "avaiable_sl",        limit: 4
    t.integer  "available_pl",       limit: 4
    t.integer  "avaiable_cl",        limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "leave_masters", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "leave_type",              limit: 255
    t.text     "reason_for_leave",        limit: 65535
    t.string   "status",                  limit: 255
    t.string   "rejection_reason",        limit: 255
    t.integer  "user_id",                 limit: 4
    t.integer  "no_of_leave_days",        limit: 4
    t.integer  "no_of_holiday",           limit: 4
    t.integer  "leave_without_pay",       limit: 4
    t.date     "remark_date"
    t.date     "apply_date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "doctorcert_file_name",    limit: 255
    t.string   "doctorcert_content_type", limit: 255
    t.integer  "doctorcert_file_size",    limit: 4
    t.datetime "doctorcert_updated_at"
    t.string   "image_file_name",         limit: 255
    t.string   "image_content_type",      limit: 255
    t.integer  "image_file_size",         limit: 4
    t.datetime "image_updated_at"
    t.date     "half_day_on_sd"
    t.date     "half_day_on_ed"
    t.string   "half_day",                limit: 255
  end

  create_table "units", force: :cascade do |t|
    t.string   "unit_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname",              limit: 255
    t.string   "middlename",             limit: 255
    t.string   "lastname",               limit: 255
    t.date     "doj"
    t.integer  "role",                   limit: 4
    t.integer  "report_to1",             limit: 4
    t.integer  "report_to2",             limit: 4
    t.integer  "gender",                 limit: 4
    t.date     "leave_start_date"
    t.date     "leave_end_date"
    t.integer  "sl",                     limit: 4
    t.integer  "pl",                     limit: 4
    t.integer  "cl",                     limit: 4
    t.integer  "presentsl",              limit: 4
    t.integer  "presentpl",              limit: 4
    t.integer  "presentcl",              limit: 4
    t.integer  "esic",                   limit: 4
    t.string   "emp_code",               limit: 255
    t.string   "group",                  limit: 255
    t.string   "branch",                 limit: 255
    t.string   "unit",                   limit: 255
    t.string   "department",             limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
