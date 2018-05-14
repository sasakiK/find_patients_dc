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

ActiveRecord::Schema.define(version: 20180301130755) do

  create_table "results", force: :cascade do |t|
    t.text "name"
    t.integer "kokuho_res1"
    t.integer "kokuho_res2"
    t.integer "kokuho_res3"
    t.integer "kouki_res1"
    t.integer "kouki_res2"
    t.integer "kouki_res3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
