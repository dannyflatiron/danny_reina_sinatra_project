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

ActiveRecord::Schema.define(version: 20200304012339) do

  create_table "athletes", force: :cascade do |t|
    t.string "username"
    # gem bcrypt hashes and salts password through a hashing algorithm 
    # should use macro 'has_secure_password' and ActiveRecord method 'authenticate'
    # prevents from having strings in the database
    t.string "password_digest"
  end

  create_table "exercises", force: :cascade do |t|
    t.string  "name"
    t.date    "date_performed"
    # change dataype for max_lift to string or figure out how to add lbs or kg to show view
    t.integer "max_lift"
    t.integer "athlete_id"
  end

end
