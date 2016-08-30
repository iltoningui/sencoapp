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

ActiveRecord::Schema.define(version: 20160830164001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gerais", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.integer  "classificacao"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "serviceable_type"
    t.integer  "serviceable_id"
    t.integer  "estado",           default: 1
    t.index ["serviceable_id"], name: "index_gerais_on_serviceable_id", using: :btree
    t.index ["serviceable_type"], name: "index_gerais_on_serviceable_type", using: :btree
  end

  create_table "localizacoes", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "city"
    t.string   "address"
    t.string   "state"
    t.string   "state_code"
    t.string   "postal_code"
    t.string   "country"
    t.string   "country_code"
    t.integer  "tipo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "endereco"
    t.string   "street"
    t.string   "locationable_type"
    t.integer  "locationable_id"
    t.index ["locationable_id"], name: "index_localizacoes_on_locationable_id", using: :btree
    t.index ["locationable_type"], name: "index_localizacoes_on_locationable_type", using: :btree
  end

  create_table "lojas", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "telefone"
    t.string   "fotografia_da_loja"
    t.integer  "estado"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "loja_id"
    t.integer  "representante_id"
    t.index ["loja_id"], name: "index_lojas_on_loja_id", using: :btree
    t.index ["representante_id"], name: "index_lojas_on_representante_id", using: :btree
  end

  create_table "piteus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.decimal  "preco"
    t.integer  "loja_id"
    t.integer  "estado"
    t.integer  "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loja_id"], name: "index_produtos_on_loja_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "apelido"
    t.string   "telefone"
    t.integer  "genero"
    t.date     "data_de_nascimento"
    t.integer  "roles_mask",         default: 12
    t.string   "nome_da_empresa"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "welcomes", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lojas", "lojas"
  add_foreign_key "produtos", "lojas"
end
