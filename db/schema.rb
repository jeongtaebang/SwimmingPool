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

ActiveRecord::Schema.define(version: 20160826111825) do

  create_table "enrollments", force: :cascade do |t|
    t.integer  "lecture_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id", "user_id"], name: "index_enrollments_on_lecture_id_and_user_id", unique: true
    t.index ["lecture_id"], name: "index_enrollments_on_lecture_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "subject",    default: "", null: false
    t.string   "teacher",    default: "", null: false
    t.text     "content",    default: "", null: false
    t.string   "timeinfo",   default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["subject"], name: "index_lectures_on_subject", unique: true
    t.index ["timeinfo"], name: "index_lectures_on_timeinfo", unique: true
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "word",       default: "", null: false
    t.text     "definition", default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
    t.index ["word"], name: "index_quizzes_on_word"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.boolean  "admin",                  default: false
    t.         "vocablist"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
    t.index ["vocablist"], name: "index_users_on_vocablist"
  end

end
