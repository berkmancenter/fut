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

  create_table "fair_use_tests", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.boolean  "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "fair_use_tests", ["owner_id"], :name => "index_fair_use_tests_on_owner_id"

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.text     "explanation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "test_answers", :force => true do |t|
    t.integer  "fair_use_test_id"
    t.integer  "purpose_id"
    t.integer  "character_id"
    t.integer  "use_id"
    t.integer  "nature_id"
    t.integer  "amount_id"
    t.integer  "impact_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "test_answers", ["amount_id"], :name => "index_test_answers_on_amount_id"
  add_index "test_answers", ["character_id"], :name => "index_test_answers_on_character_id"
  add_index "test_answers", ["fair_use_test_id"], :name => "index_test_answers_on_fair_use_test_id"
  add_index "test_answers", ["impact_id"], :name => "index_test_answers_on_impact_id"
  add_index "test_answers", ["nature_id"], :name => "index_test_answers_on_nature_id"
  add_index "test_answers", ["purpose_id"], :name => "index_test_answers_on_purpose_id"
  add_index "test_answers", ["use_id"], :name => "index_test_answers_on_use_id"

  create_table "visitors", :force => true do |t|
    t.string   "name"
    t.string   "ip_adress"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
