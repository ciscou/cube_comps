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

ActiveRecord::Schema.define(:version => 20120302093532) do

  create_table "competitions", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "city"
    t.string   "address"
    t.date     "start_on"
    t.date     "end_on"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "has_category_333"
    t.boolean  "has_category_444"
    t.boolean  "has_category_555"
    t.boolean  "has_category_222"
    t.boolean  "has_category_333bf"
    t.boolean  "has_category_333oh"
    t.boolean  "has_category_333fm"
    t.boolean  "has_category_333ft"
    t.boolean  "has_category_minx"
    t.boolean  "has_category_pyram"
    t.boolean  "has_category_sq1"
    t.boolean  "has_category_clock"
    t.boolean  "has_category_666"
    t.boolean  "has_category_777"
    t.boolean  "has_category_magic"
    t.boolean  "has_category_mmagic"
    t.boolean  "has_category_444bf"
    t.boolean  "has_category_555bf"
    t.boolean  "has_category_333mbf"
  end

  add_index "competitions", ["user_id"], :name => "index_competitions_on_user_id"

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "has_category_333"
    t.boolean  "has_category_444"
    t.boolean  "has_category_555"
    t.boolean  "has_category_222"
    t.boolean  "has_category_333bf"
    t.boolean  "has_category_333oh"
    t.boolean  "has_category_333fm"
    t.boolean  "has_category_333ft"
    t.boolean  "has_category_minx"
    t.boolean  "has_category_pyram"
    t.boolean  "has_category_sq1"
    t.boolean  "has_category_clock"
    t.boolean  "has_category_666"
    t.boolean  "has_category_777"
    t.boolean  "has_category_magic"
    t.boolean  "has_category_mmagic"
    t.boolean  "has_category_444bf"
    t.boolean  "has_category_555bf"
    t.boolean  "has_category_333mbf"
  end

  add_index "entries", ["competition_id"], :name => "index_entries_on_competition_id"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "events", :force => true do |t|
    t.integer  "competition_id"
    t.string   "category_code"
    t.integer  "rounds_count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "events", ["competition_id"], :name => "index_events_on_competition_id"

  create_table "results", :force => true do |t|
    t.integer  "competition_id"
    t.integer  "user_id"
    t.string   "event"
    t.integer  "round",                                        :default => 1
    t.integer  "group",                                        :default => 1
    t.decimal  "time1",          :precision => 7, :scale => 2
    t.decimal  "time2",          :precision => 7, :scale => 2
    t.decimal  "time3",          :precision => 7, :scale => 2
    t.decimal  "time4",          :precision => 7, :scale => 2
    t.decimal  "time5",          :precision => 7, :scale => 2
    t.decimal  "average",        :precision => 7, :scale => 2
    t.decimal  "best",           :precision => 7, :scale => 2
    t.decimal  "worst",          :precision => 7, :scale => 2
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  add_index "results", ["competition_id"], :name => "index_results_on_competition_id"
  add_index "results", ["user_id"], :name => "index_results_on_user_id"

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
