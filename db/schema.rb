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

ActiveRecord::Schema.define(version: 2021_11_01_023324) do

  create_table "student_classes", force: :cascade do |t|
    t.integer "class_number"
    t.string "teacher1"
    t.string "teacher2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "marks1"
    t.integer "marks2"
    t.integer "marks3"
    t.integer "student_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rollnumber"
    t.index ["student_class_id"], name: "index_students_on_student_class_id"
  end

end
