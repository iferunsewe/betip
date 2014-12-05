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

ActiveRecord::Schema.define(:version => 20141204103641) do

  create_table "predictions", :force => true do |t|
    t.datetime "date"
    t.string   "homeTeam"
    t.string   "awayTeam"
    t.integer  "predictionGoalsHomeTeam"
    t.integer  "predictionGoalsAwayTeam"
    t.integer  "type_of_bet_id"
    t.integer  "user_id"
    t.integer  "result_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "predictions_tips", :id => false, :force => true do |t|
    t.integer "prediction_id"
    t.integer "tip_id"
  end

  create_table "predictions_type_of_bets", :id => false, :force => true do |t|
    t.integer "prediction_id"
    t.integer "type_of_bet_id"
  end

  create_table "results", :force => true do |t|
    t.integer  "goalsHomeTeam"
    t.integer  "goalsAwayTeam"
    t.integer  "prediction_id"
    t.boolean  "betWon"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tips", :force => true do |t|
    t.float    "odds"
    t.string   "bookies"
    t.boolean  "won"
    t.integer  "prediction_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "type_of_bets", :force => true do |t|
    t.string   "name"
    t.integer  "prediction_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "user_connections", :force => true do |t|
    t.integer  "tipster_id",  :null => false
    t.integer  "customer_id", :null => false
    t.boolean  "following"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "firstname"
    t.string   "lastname"
    t.float    "win_percentage"
    t.text     "user_image"
    t.float    "price"
    t.string   "role"
    t.string   "provider"
    t.string   "uid"
    t.integer  "prediction_id"
    t.integer  "tip_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
