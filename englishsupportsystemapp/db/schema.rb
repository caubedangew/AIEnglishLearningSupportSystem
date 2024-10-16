# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_16_151258) do
  create_table "answers", charset: "utf8mb3", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.boolean "is_correct"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "courses", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "exercise_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lesson_id"
    t.index ["lesson_id"], name: "index_exercises_on_lesson_id"
  end

  create_table "grammars", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "questions", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_id"
    t.index ["exercise_id"], name: "index_questions_on_exercise_id"
  end

  create_table "result_details", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "result_id", null: false
    t.float "score"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_result_details_on_result_id"
  end

  create_table "results", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_results_on_exercise_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "role"
    t.date "date_of_birth"
    t.boolean "gender"
    t.integer "english_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vocabularies", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "meaning"
    t.string "pronounce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "exercises", "lessons"
  add_foreign_key "lessons", "courses"
  add_foreign_key "questions", "exercises"
  add_foreign_key "result_details", "results"
  add_foreign_key "results", "exercises"
  add_foreign_key "results", "users"
end
