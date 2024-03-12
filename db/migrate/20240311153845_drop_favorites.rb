class DropFavorites < ActiveRecord::Migration[7.1]
  def up
    drop_table :favorites
  end

  def down
    create_table :favorites do |t|
      t.bigint "user_id", null: false
      t.bigint "recipe_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["recipe_id"], name: "index_favorites_on_recipe_id"
      t.index ["user_id"], name: "index_favorites_on_user_id"
    end
  end
end
