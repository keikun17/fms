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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110817033611) do

  create_table "accident_assignee_expenses", :force => true do |t|
    t.integer  "accident_id"
    t.string   "hospital"
    t.float    "repair_estimate"
    t.string   "paid_by"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accident_vehicle_expenses", :force => true do |t|
    t.integer  "accident_id"
    t.integer  "service_center_id"
    t.float    "repair_estimate"
    t.string   "paid_by"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accidents", :force => true do |t|
    t.datetime "accident_date"
    t.string   "location"
    t.text     "description"
    t.string   "reference"
    t.integer  "service_center_id"
    t.float    "repair_estimate"
    t.float    "deductible"
    t.text     "remarks"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administrators", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["email"], :name => "index_administrators_on_email", :unique => true
  add_index "administrators", ["reset_password_token"], :name => "index_administrators_on_reset_password_token", :unique => true

  create_table "admins", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignees", :force => true do |t|
    t.integer  "vehicle_id"
    t.string   "direct_line"
    t.string   "tel_no"
    t.string   "designation"
    t.string   "email"
    t.string   "mobile"
    t.string   "firstname"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batteries", :force => true do |t|
    t.integer  "vehicle_id"
    t.datetime "replacement_date"
    t.float    "odometer_reading"
    t.string   "brand"
    t.string   "model"
    t.string   "size"
    t.string   "supplier"
    t.float    "amount"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string "name"
    t.string "address"
  end

  create_table "company_users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.datetime "birth_date"
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_users", ["email"], :name => "index_company_users_on_email", :unique => true
  add_index "company_users", ["reset_password_token"], :name => "index_company_users_on_reset_password_token", :unique => true

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"
  add_index "delayed_jobs", ["vehicle_id"], :name => "index_delayed_jobs_on_vehicle_id"

  create_table "fleet_users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fleet_users", ["email"], :name => "index_fleet_users_on_email", :unique => true
  add_index "fleet_users", ["reset_password_token"], :name => "index_fleet_users_on_reset_password_token", :unique => true

  create_table "fleets", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuel_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurances", :force => true do |t|
    t.integer  "vehicle_id"
    t.string   "company"
    t.string   "policy_number"
    t.datetime "expiry_date"
  end

  create_table "mileages", :force => true do |t|
    t.datetime "date_logged"
    t.float    "reading"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preventive_maintenances", :force => true do |t|
    t.integer  "vehicle_id"
    t.integer  "service_center_id"
    t.string   "pms_milestone"
    t.string   "reference"
    t.float    "odometer_reading"
    t.datetime "pms_date"
    t.float    "amount"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_renewals", :force => true do |t|
    t.date     "renewal_date"
    t.string   "registration_office"
    t.float    "amount_paid"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reminders", :force => true do |t|
    t.integer  "reminder_type_id"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "reminder_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repair_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_centers", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tires", :force => true do |t|
    t.integer  "vehicle_id"
    t.datetime "replacement_date"
    t.float    "odometer_reading"
    t.string   "brand"
    t.string   "model"
    t.string   "size"
    t.string   "supplier"
    t.float    "unit_price"
    t.integer  "quantity"
    t.float    "parts_expense"
    t.float    "labor_expense"
    t.float    "amount"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_repair_details", :force => true do |t|
    t.integer  "vehicle_repair_id"
    t.float    "quantity"
    t.string   "item"
    t.float    "unit_price"
    t.float    "amount"
    t.integer  "repair_type_id"
    t.string   "warranty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_repairs", :force => true do |t|
    t.datetime "invoice_date"
    t.float    "odometer_reading"
    t.float    "subtotal"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_center_id"
    t.string   "reference_number"
    t.text     "remarks"
    t.float    "amount"
  end

  add_index "vehicle_repairs", ["service_center_id"], :name => "index_vehicle_repairs_on_service_center_id"

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "plate_number"
    t.string   "conduction_sticker_number"
    t.string   "color"
    t.string   "transmission_type"
    t.string   "chassis_number"
    t.string   "state"
    t.integer  "fleet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "purchase_date"
    t.float    "purchase_amount"
    t.string   "car_dealer"
    t.string   "sales_executive"
    t.string   "registered_owner"
    t.string   "initial_registration_office"
    t.string   "registration_mv_file_number"
    t.string   "division"
    t.string   "area"
    t.string   "engine_number"
    t.integer  "fuel_type_id"
    t.integer  "pms_interval",                :default => 5000
  end

end
