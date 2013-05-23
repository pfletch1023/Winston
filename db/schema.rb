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

ActiveRecord::Schema.define(:version => 20130523043352) do

  create_table "statics", :force => true do |t|
    t.string "paralink"
    t.text   "content"
  end

  create_table "types", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "password_salt"
    t.string "password_hash"
  end

  create_table "works", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "role"
    t.datetime "datetime"
    t.integer  "type_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "program"
    t.string   "director"
    t.string   "domain"
    t.string   "video_url"
  end

end
