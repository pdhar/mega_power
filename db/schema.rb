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

ActiveRecord::Schema.define(:version => 20130116085724) do

  create_table "labours", :force => true do |t|
    t.string   "labour_no"
    t.string   "labour_name"
    t.string   "labour_description"
    t.decimal  "labour_cost_per_hr"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "parts", :force => true do |t|
    t.string   "part_name"
    t.string   "part_no"
    t.text     "part_description"
    t.decimal  "part_cost"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
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
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.decimal  "service_cost"
  end

end
