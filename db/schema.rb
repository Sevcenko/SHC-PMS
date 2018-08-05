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

ActiveRecord::Schema.define(version: 20180421154426) do

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.integer "hours"
    t.integer "minutes"
    t.string "appointmentType"
    t.text "description"
    t.integer "patient_id"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "password_digest"
    t.string "email"
    t.date "birthday"
    t.integer "addressNumber"
    t.text "address_street"
    t.string "city"
    t.text "phoneNumber"
    t.string "clinic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.date "birthday"
    t.integer "addressNumber"
    t.text "address_street"
    t.string "city"
    t.text "phoneNumber"
    t.string "clinic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "doctor_id"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "doctor"
    t.text "reason"
    t.text "diagnosis"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_records_on_patient_id"
  end

end
