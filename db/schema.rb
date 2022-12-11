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

ActiveRecord::Schema.define(version: 2022_12_11_151104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characteristics", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "brawn"
    t.integer "agility"
    t.integer "intellect"
    t.integer "cunning"
    t.integer "willpower"
    t.integer "char_presence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_characteristics_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "specialization"
    t.string "career"
    t.integer "age"
    t.string "height"
    t.string "build"
    t.string "hair"
    t.string "eyes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "critical_injuries", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "severity"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_critical_injuries_on_character_id"
  end

  create_table "equipment_logs", force: :cascade do |t|
    t.bigint "character_id"
    t.string "credits"
    t.string "weapons"
    t.string "armor"
    t.string "personal_gear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_equipment_logs_on_character_id"
  end

  create_table "motivations", force: :cascade do |t|
    t.bigint "character_id"
    t.string "mo_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_motivations_on_character_id"
  end

  create_table "obligations", force: :cascade do |t|
    t.bigint "character_id"
    t.string "ob_type"
    t.integer "magnitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_obligations_on_character_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "astrogation"
    t.integer "athletics"
    t.integer "charm"
    t.integer "coercion"
    t.integer "computers"
    t.integer "cool"
    t.integer "coordination"
    t.integer "deception"
    t.integer "discipline"
    t.integer "leadership"
    t.integer "mechanics"
    t.integer "negotiation"
    t.integer "perception"
    t.integer "piloting"
    t.integer "piloting_space"
    t.integer "resilience"
    t.integer "skulduggery"
    t.integer "stealth"
    t.integer "street_wise"
    t.integer "survival"
    t.integer "vigilance"
    t.integer "brawl"
    t.integer "gunnery"
    t.integer "melee"
    t.integer "ranged_light"
    t.integer "ranged_heavy"
    t.integer "core_worlds"
    t.integer "education"
    t.integer "lore"
    t.integer "outer_rim"
    t.integer "underworld"
    t.integer "xenology"
    t.integer "medicine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

  create_table "talents", force: :cascade do |t|
    t.bigint "character_id"
    t.string "name"
    t.integer "page_number"
    t.string "ability_summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_talents_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "weapons", force: :cascade do |t|
    t.bigint "character_id"
    t.string "skill"
    t.string "special"
    t.integer "damage"
    t.integer "range"
    t.integer "critical"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_weapons_on_character_id"
  end

  add_foreign_key "characteristics", "characters"
  add_foreign_key "characters", "users"
  add_foreign_key "critical_injuries", "characters"
  add_foreign_key "equipment_logs", "characters"
  add_foreign_key "motivations", "characters"
  add_foreign_key "obligations", "characters"
  add_foreign_key "skills", "characters"
  add_foreign_key "talents", "characters"
  add_foreign_key "weapons", "characters"
end
