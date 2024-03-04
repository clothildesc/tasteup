class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :difficulty
      t.integer :cooking_time
      t.integer :preparation_time
      t.integer :number_of_servings
      t.references :user, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
