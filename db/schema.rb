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

ActiveRecord::Schema.define(:version => 20120622235535) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id", :null => false
    t.string   "content"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "attachments", :force => true do |t|
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "cases", :force => true do |t|
    t.string   "title"
    t.text     "facts"
    t.integer  "no_of_tests",            :default => 0
    t.integer  "court_decision_id"
    t.integer  "original_resource_id",                  :null => false
    t.integer  "derivative_resource_id",                :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "cases", ["court_decision_id"], :name => "index_cases_on_court_decision_id"
  add_index "cases", ["derivative_resource_id"], :name => "index_cases_on_derivative_resource_id"
  add_index "cases", ["original_resource_id"], :name => "index_cases_on_original_resource_id"

  create_table "fair_use_tests", :force => true do |t|
    t.integer  "test_answer_id", :null => false
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "fair_use_tests", ["test_answer_id"], :name => "index_fair_use_tests_on_test_answer_id"

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.text     "explanation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "test_answers", :force => true do |t|
    t.integer  "purpose_id",     :null => false
    t.integer  "character_id",   :null => false
    t.integer  "use_id",         :null => false
    t.integer  "nature_id",      :null => false
    t.integer  "amount_id",      :null => false
    t.integer  "impact_id",      :null => false
    t.integer  "tested_case_id"
    t.integer  "owner_id",       :null => false
    t.string   "owner_type",     :null => false
    t.boolean  "result"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "test_answers", ["amount_id"], :name => "index_test_answers_on_amount_id"
  add_index "test_answers", ["character_id"], :name => "index_test_answers_on_character_id"
  add_index "test_answers", ["impact_id"], :name => "index_test_answers_on_impact_id"
  add_index "test_answers", ["nature_id"], :name => "index_test_answers_on_nature_id"
  add_index "test_answers", ["owner_id"], :name => "index_test_answers_on_owner_id"
  add_index "test_answers", ["purpose_id"], :name => "index_test_answers_on_purpose_id"
  add_index "test_answers", ["tested_case_id"], :name => "index_test_answers_on_tested_case_id"
  add_index "test_answers", ["use_id"], :name => "index_test_answers_on_use_id"

  create_table "visitors", :force => true do |t|
    t.string   "name",       :default => "Anonymous"
    t.string   "ip_adress"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
