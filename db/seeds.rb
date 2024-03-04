Recipe.destroy_all
Category.destroy_all
Ingredient.destroy_all
User.destroy_all

user1 = User.create!(email: 'bob@mail.com', password: '123456')


categories = %w[entree plat dessert]
ingredients = %w[poulet boeuf poisson legumes fruits farine sucre beurre lait oeuf sel poivre huile vinaigre eau]

puts 'creating categories...'
categories.each do |category|
  Category.create!(name: category)
end

puts 'creating ingredients...'
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end


recipes_raw = [
  {
    title: 'Cookies',
    category_name: 'dessert',
    user_email: 'bob@mail.com',
    difficulty: 'facile',
    cooking_time: 15,
    preparation_time: 10,
    number_of_servings: 4,
    note: 'Recette facile et rapide',
    ingredients: [
      { name: 'farine', quantity_value: 200, quantity_unit: 'g' },
      { name: 'sucre', quantity_value: 100, quantity_unit: 'g' },
      { name: 'beurre', quantity_value: 100, quantity_unit: 'g' }
    ],
    steps: [
      { step_number: 1, instruction: 'Mélanger...' },
      { step_number: 2, instruction: 'Ajouter...' },
      { step_number: 3, instruction: 'Former...' },
      { step_number: 4, instruction: 'Cuire...' }
    ]
  },
]

recipes_raw.each do |recipe_raw|
  recipe = Recipe.create!(
    title: recipe_raw[:title],
    categories: [Category.find_by(name: recipe_raw[:category_name])],
    user: User.find_by(email: recipe_raw[:user_email]),
    difficulty: recipe_raw[:difficulty],
    cooking_time: recipe_raw[:cooking_time],
    preparation_time: recipe_raw[:preparation_time],
    number_of_servings: recipe_raw[:number_of_servings],
    note: recipe_raw[:note]
  )

  recipe_raw[:ingredients].each do |ingredient_raw|
    ingredient = Ingredient.find_by(name: ingredient_raw[:name])
    RecipeIngredient.create!(
      recipe: recipe,
      ingredient: ingredient,
      quantity_value: ingredient_raw[:quantity_value],
      quantity_unit: ingredient_raw[:quantity_unit]
    )
  end

  recipe_raw[:steps].each do |step_raw|
    PreparationStep.create!(
      recipe: recipe,
      step_number: step_raw[:step_number],
      instruction: step_raw[:instruction]
    )
  end
end
