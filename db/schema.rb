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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130211073808) do

  create_table "breakdowns", :force => true do |t|
    t.string   "breakdown_name"
    t.text     "breakdown_description"
    t.integer  "breakdown_no"
    t.decimal  "breakdown_cost",        :default => 0.0, :null => false
    t.decimal  "total_parts_cost",      :default => 0.0, :null => false
    t.decimal  "total_labour_cost",     :default => 0.0, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "breakdowns_componentmonths", :id => false, :force => true do |t|
    t.integer "componentmonth_id"
    t.integer "breakdown_id"
  end

  create_table "breakdowns_labours", :id => false, :force => true do |t|
    t.integer "breakdown_id"
    t.integer "labour_id"
  end

  create_table "breakdowns_parts", :id => false, :force => true do |t|
    t.integer "breakdown_id"
    t.integer "part_id"
  end

  create_table "componentmonths", :force => true do |t|
    t.integer  "component_id"
    t.date     "date_month"
    t.string   "description"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.decimal  "total_service_cost",   :default => 0.0, :null => false
    t.decimal  "total_service_parts",  :default => 0.0, :null => false
    t.decimal  "total_service_labour", :default => 0.0, :null => false
    t.decimal  "total_break_cost",     :default => 0.0, :null => false
    t.decimal  "total_break_parts",    :default => 0.0, :null => false
    t.decimal  "total_break_labour",   :default => 0.0, :null => false
    t.string   "site_name"
    t.decimal  "onhire_hrs",           :default => 0.0, :null => false
    t.decimal  "offhire_hrs",          :default => 0.0, :null => false
    t.decimal  "total_hrs",            :default => 0.0, :null => false
  end

  create_table "componentmonths_services", :id => false, :force => true do |t|
    t.integer "componentmonth_id"
    t.integer "service_id"
  end

  create_table "components", :force => true do |t|
    t.decimal  "price"
    t.decimal  "depreciation"
    t.string   "model_no"
    t.string   "eng_model_no"
    t.string   "serial_no"
    t.string   "eng_serial_no"
    t.string   "alternator_sr_no"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.decimal  "total_service_cost", :default => 0.0, :null => false
    t.date     "commision_date"
    t.date     "purchase_date"
    t.decimal  "depreciated_cost",   :default => 0.0, :null => false
    t.string   "rating"
    t.string   "mpgno"
  end

  create_table "components_rentalitems", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "rentalitem_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "contact1"
    t.string   "contact2"
    t.string   "contact3"
    t.string   "telephone"
    t.string   "fax"
    t.string   "email"
    t.text     "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "labours", :force => true do |t|
    t.string   "labour_no"
    t.string   "labour_name"
    t.string   "labour_description"
    t.decimal  "labour_cost_per_hr"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "labours_services", :id => false, :force => true do |t|
    t.integer "service_id"
    t.integer "labour_id"
  end

  create_table "parts", :force => true do |t|
    t.string   "part_name"
    t.string   "part_no"
    t.text     "part_description"
    t.decimal  "part_cost"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "rentalitems", :force => true do |t|
    t.date     "start"
    t.date     "end"
    t.decimal  "price"
    t.integer  "rental_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rentals", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "total_rental_price"
    t.text     "address"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "servicepartsments", :force => true do |t|
    t.integer  "service_id"
    t.integer  "part_id"
    t.datetime "date_added"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "service_name"
    t.text     "service_description"
    t.string   "service_no"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.decimal  "service_cost",        :default => 0.0, :null => false
    t.decimal  "total_parts_cost",    :default => 0.0, :null => false
    t.decimal  "total_labour_cost",   :default => 0.0, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
