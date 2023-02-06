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

ActiveRecord::Schema[7.0].define(version: 2023_02_06_143356) do
  create_table "telefons", force: :cascade do |t|
    t.string "producent"
    t.string "nazwa"
    t.string "system"
    t.float "ekran"
    t.float "rozdzielczosc"
    t.float "ram"
    t.float "pamiec"
    t.float "bateria"
    t.string "microsd"
    t.string "dualsim"
    t.string "kolor"
    t.float "aparat"
    t.string "audio"
    t.string "nfc"
    t.string "lacznosc"
    t.string "klawiatura"
    t.string "opis"
    t.boolean "czy_uzywany"
    t.boolean "czy_uszkodzony"
    t.float "cena"
    t.string "zdjeciebin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
