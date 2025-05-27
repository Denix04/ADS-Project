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

ActiveRecord::Schema[7.1].define(version: 2025_05_22_224541) do
  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "saldo", precision: 10, scale: 2
    t.string "cbu"
    t.string "alias"
    t.boolean "es_subcuenta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "movements", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "reason"
    t.string "service"
    t.datetime "date"
    t.string "type"
    t.integer "origin_id"
    t.integer "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_movements_on_destination_id"
    t.index ["origin_id"], name: "index_movements_on_origin_id"
  end

  create_table "restrictions", force: :cascade do |t|
    t.integer "cuenta_primaria_id", null: false
    t.integer "subcuenta_id", null: false
    t.string "type", null: false
    t.decimal "monto"
    t.text "dias", null: false
    t.time "horario_inicio"
    t.time "horario_fin"
    t.boolean "baja", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuenta_primaria_id"], name: "index_restrictions_on_cuenta_primaria_id"
    t.index ["subcuenta_id"], name: "index_restrictions_on_subcuenta_id"
  end

  create_table "service_accounts", force: :cascade do |t|
    t.integer "id_cliente", null: false
    t.string "nombre_responsable", null: false
    t.date "fecha_asociacion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "dni"
    t.string "localidad"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "movements", "accounts", column: "destination_id"
  add_foreign_key "movements", "accounts", column: "origin_id"
  add_foreign_key "restrictions", "accounts", column: "cuenta_primaria_id"
  add_foreign_key "restrictions", "accounts", column: "subcuenta_id"
end
