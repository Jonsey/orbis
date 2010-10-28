# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101028181756) do

  create_table "applications", :id => false, :force => true do |t|
    t.integer  "candidate_id"
    t.integer  "vacancy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cvs", :force => true do |t|
    t.integer  "candidate_id",      :null => false
    t.string   "title"
    t.string   "item_file_name"
    t.string   "item_content_type"
    t.string   "item_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.string   "white_paper_file_name"
    t.string   "white_paper_content_type"
    t.string   "white_paper_file_size"
    t.string   "white_paper_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string  "name"
    t.string  "controller"
    t.string  "action"
    t.string  "parameters"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
  end

  add_index "pages", ["name", "parent_id"], :name => "index_page_on_name_and_parent_id"

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_user_groups", :id => false, :force => true do |t|
    t.integer "permission_id"
    t.integer "user_group_id"
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups_users", :id => false, :force => true do |t|
    t.integer "user_group_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "telephone"
    t.string   "company_name"
    t.string   "type"
    t.boolean  "active"
  end

  add_index "users", ["company_name"], :name => "index_users_on_company_name"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["type"], :name => "index_users_on_type"

  create_table "vacancies", :force => true do |t|
    t.string   "role"
    t.string   "salary"
    t.string   "location"
    t.string   "status"
    t.text     "role_description"
    t.integer  "client_id",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "staff_id"
  end

  add_index "vacancies", ["client_id"], :name => "index_vacancies_on_client_id"
  add_index "vacancies", ["staff_id"], :name => "index_vacancies_on_staff_id"
  add_index "vacancies", ["status"], :name => "index_vacancies_on_status"

end
