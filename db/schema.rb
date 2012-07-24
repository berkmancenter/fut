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

ActiveRecord::Schema.define(:version => 20120722084349) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "answers", :force => true do |t|
    t.integer  "question_id", :null => false
    t.string   "content"
    t.integer  "value"
    t.text     "explanation"
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

  create_table "calculators", :force => true do |t|
    t.integer  "owner_id",   :null => false
    t.string   "owner_type", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "calculators", ["owner_id"], :name => "index_calculators_on_owner_id"

  create_table "case_answers", :force => true do |t|
    t.integer  "case_id"
    t.integer  "owner_id",   :null => false
    t.string   "owner_type", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "case_answers", ["case_id"], :name => "index_case_answers_on_case_id"
  add_index "case_answers", ["owner_id"], :name => "index_case_answers_on_owner_id"

  create_table "cases", :force => true do |t|
    t.string   "title"
    t.text     "facts"
    t.integer  "no_of_tests",            :default => 0
    t.integer  "original_resource_id",                  :null => false
    t.integer  "derivative_resource_id",                :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "cases", ["derivative_resource_id"], :name => "index_cases_on_derivative_resource_id"
  add_index "cases", ["original_resource_id"], :name => "index_cases_on_original_resource_id"

  create_table "court_decision_details", :force => true do |t|
    t.integer  "test_answer_id"
    t.text     "purpose"
    t.text     "character"
    t.text     "use"
    t.text     "nature"
    t.text     "amount"
    t.text     "financial"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "court_decision_details", ["test_answer_id"], :name => "index_court_decision_details_on_test_answer_id"

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.text     "explanation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specializations", :force => true do |t|
    t.integer  "case_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "specializations", ["case_id", "role_id"], :name => "index_specializations_on_case_id_and_role_id"

  create_table "test_answers", :force => true do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "purpose_id",   :null => false
    t.integer  "character_id", :null => false
    t.integer  "use_id",       :null => false
    t.integer  "nature_id",    :null => false
    t.integer  "amount_id",    :null => false
    t.integer  "financial_id", :null => false
    t.boolean  "result"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "test_answers", ["amount_id"], :name => "index_test_answers_on_amount_id"
  add_index "test_answers", ["character_id"], :name => "index_test_answers_on_character_id"
  add_index "test_answers", ["financial_id"], :name => "index_test_answers_on_financial_id"
  add_index "test_answers", ["nature_id"], :name => "index_test_answers_on_nature_id"
  add_index "test_answers", ["purpose_id"], :name => "index_test_answers_on_purpose_id"
  add_index "test_answers", ["target_id"], :name => "index_test_answers_on_target_id"
  add_index "test_answers", ["use_id"], :name => "index_test_answers_on_use_id"

  create_table "visitors", :force => true do |t|
    t.string   "name",       :default => "Anonymous"
    t.string   "ip_adress"
    t.integer  "role_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "visitors", ["role_id"], :name => "index_visitors_on_role_id"

end
