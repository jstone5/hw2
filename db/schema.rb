ActiveRecord::Schema.define(version: 2022_02_03_031449) do


    create_table "movies", force: :cascade do |t|
      t.string "title"
      t.string "year_released"
      t.string "rated"
      t.string "person_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end


    create_table "people", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end


    create_table "roles", force: :cascade do |t|
      t.string "movie_id"
      t.string "person_id"
      t.string "character_name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

end

