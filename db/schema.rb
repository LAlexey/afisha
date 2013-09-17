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

ActiveRecord::Schema.define(:version => 20130917084649) do

  create_table "blog_post_additions", :force => true do |t|
    t.string  "emotions"
    t.integer "section_id"
    t.integer "blog_post_id"
  end

  create_table "materials", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "publication_date"
    t.string   "type"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "author_id",        :limit => 24
  end

  add_index "materials", ["type"], :name => "index_materials_on_type"

  create_table "menu_items", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "url"
    t.string   "condition"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.string "title"
  end

  create_table "top_list_items", :force => true do |t|
    t.integer  "position"
    t.integer  "positioned_id"
    t.string   "positioned_type"
    t.string   "context"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
