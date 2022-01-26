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

ActiveRecord::Schema.define(version: 2022_01_25_202214) do

  create_table "actors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string "rating_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "release_years", force: :cascade do |t|
    t.integer "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "title_actors", force: :cascade do |t|
    t.integer "title_id", null: false
    t.integer "actor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_title_actors_on_actor_id"
    t.index ["title_id"], name: "index_title_actors_on_title_id"
  end

  create_table "title_categories", force: :cascade do |t|
    t.integer "title_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_title_categories_on_category_id"
    t.index ["title_id"], name: "index_title_categories_on_title_id"
  end

  create_table "title_directors", force: :cascade do |t|
    t.integer "title_id", null: false
    t.integer "director_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["director_id"], name: "index_title_directors_on_director_id"
    t.index ["title_id"], name: "index_title_directors_on_title_id"
  end

  create_table "titles", force: :cascade do |t|
    t.string "show_id", null: false
    t.string "title", null: false
    t.date "date_added"
    t.string "duration"
    t.text "description"
    t.integer "type_id"
    t.integer "country_id"
    t.integer "release_year_id"
    t.integer "rating_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_titles_on_country_id"
    t.index ["rating_id"], name: "index_titles_on_rating_id"
    t.index ["release_year_id"], name: "index_titles_on_release_year_id"
    t.index ["type_id"], name: "index_titles_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "title_actors", "actors"
  add_foreign_key "title_actors", "titles"
  add_foreign_key "title_categories", "categories"
  add_foreign_key "title_categories", "titles"
  add_foreign_key "title_directors", "directors"
  add_foreign_key "title_directors", "titles"
  add_foreign_key "titles", "countries"
  add_foreign_key "titles", "ratings"
  add_foreign_key "titles", "release_years"
  add_foreign_key "titles", "types"
end
