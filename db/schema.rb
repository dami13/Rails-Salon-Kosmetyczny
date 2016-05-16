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

ActiveRecord::Schema.define(version: 20160508113046) do

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    # t.string   "email",                  default: "", null: false
    # t.string   "password",    limit: 16,              null: false
    t.string   "address"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    # t.string   "email",                   default: "", null: false
    # t.string   "password"
    t.integer  "phone_number"
    t.string   "desc"
    t.boolean  "is_admin"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employees_services", id: false, force: :cascade do |t|
    t.integer "employee_id"
    t.integer "service_id"
  end

  add_index "employees_services", ["employee_id", "service_id"], name: "index_employees_services_on_employee_id_and_service_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.integer  "duration"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "services_visits", force: :cascade do |t|
    t.integer "client_id"
    t.integer "employee_id"
    t.integer "service_id"
    t.integer "visit_id"
    t.string "client_opinion_comment"
    t.integer "client_opinion_rating"
    t.boolean "client_opinion_added"
  end

  add_index "services_visits", ["client_id", "employee_id", "service_id", "visit_id"], name: "index_services_visits_on_c_id_and_e_id_and_s_id_and_vs_id"

  create_table "visits", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "price"
    t.integer  "discount"
    t.string   "comments"
    t.boolean  "status"
    t.datetime     "start_time"
    t.boolean  "sms"
    t.boolean  "email"
    t.time     "sms_time"
    t.time     "email_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "visits", ["client_id"], name: "index_visits_on_client_id"

end
