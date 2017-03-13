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

ActiveRecord::Schema.define(version: 20170321095210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "answerable_type"
    t.integer  "answerable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["answerable_type", "answerable_id"], name: "index_answers_on_answerable_type_and_answerable_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.text     "content"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["parent_id"], name: "index_comments_on_parent_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "level"
    t.integer  "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "downvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_downvotes_on_comment_id", using: :btree
    t.index ["user_id", "comment_id"], name: "index_downvotes_on_user_id_and_comment_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_downvotes_on_user_id", using: :btree
  end

  create_table "essay_questions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "priority"
    t.string   "number"
    t.text     "question"
    t.text     "answer"
    t.text     "explanation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["quiz_id"], name: "index_essay_questions_on_quiz_id", using: :btree
  end

  create_table "fill_in_questions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "priority"
    t.string   "number"
    t.text     "question"
    t.text     "answer"
    t.text     "explanation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["quiz_id"], name: "index_fill_in_questions_on_quiz_id", using: :btree
  end

  create_table "headers", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "priority"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_headers_on_quiz_id", using: :btree
  end

  create_table "multiple_choice_questions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "priority"
    t.string   "number"
    t.text     "question"
    t.string   "choices"
    t.text     "answer"
    t.text     "explanation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["quiz_id"], name: "index_multiple_choice_questions_on_quiz_id", using: :btree
  end

  create_table "offerings", force: :cascade do |t|
    t.integer  "programme_id"
    t.integer  "course_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["course_id"], name: "index_offerings_on_course_id", using: :btree
    t.index ["programme_id", "course_id"], name: "index_offerings_on_programme_id_and_course_id", unique: true, using: :btree
    t.index ["programme_id"], name: "index_offerings_on_programme_id", using: :btree
  end

  create_table "programmes", force: :cascade do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_programmes_on_school_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_purchases_on_quiz_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "instructions"
    t.float    "duration"
    t.integer  "quiz_type"
    t.integer  "year"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pasco_credits"
    t.index ["course_id"], name: "index_quizzes_on_course_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_schools_on_name", unique: true, using: :btree
    t.index ["short_name"], name: "index_schools_on_short_name", unique: true, using: :btree
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_upvotes_on_comment_id", using: :btree
    t.index ["user_id", "comment_id"], name: "index_upvotes_on_user_id_and_comment_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_upvotes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "display_name"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "vouchers", force: :cascade do |t|
    t.string   "code"
    t.integer  "credits"
    t.integer  "price_pesewas"
    t.datetime "print_time"
    t.datetime "usage_time"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_vouchers_on_user_id", using: :btree
  end

  add_foreign_key "answers", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "downvotes", "comments"
  add_foreign_key "downvotes", "users"
  add_foreign_key "essay_questions", "quizzes"
  add_foreign_key "fill_in_questions", "quizzes"
  add_foreign_key "headers", "quizzes"
  add_foreign_key "multiple_choice_questions", "quizzes"
  add_foreign_key "offerings", "courses"
  add_foreign_key "offerings", "programmes"
  add_foreign_key "programmes", "schools"
  add_foreign_key "purchases", "quizzes"
  add_foreign_key "purchases", "users"
  add_foreign_key "quizzes", "courses"
  add_foreign_key "upvotes", "comments"
  add_foreign_key "upvotes", "users"
  add_foreign_key "vouchers", "users"
end
