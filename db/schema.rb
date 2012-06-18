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

ActiveRecord::Schema.define(:version => 20120617174334) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.text     "explanation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "selected_answers", :force => true do |t|
    t.integer  "test_id"
    t.integer  "owner_id"
    t.integer  "answer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "selected_answers", ["answer_id"], :name => "index_selected_answers_on_answer_id"
  add_index "selected_answers", ["owner_id"], :name => "index_selected_answers_on_owner_id"
  add_index "selected_answers", ["test_id"], :name => "index_selected_answers_on_test_id"

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.boolean  "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tests", ["owner_id"], :name => "index_tests_on_owner_id"

  create_table "visitors", :force => true do |t|
    t.string   "name"
    t.string   "ip_adress"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
