require "open-uri"

class CreateRecipeFromScrapData
  def initialize(scrap_data, user:)
    @scrap_data = scrap_data
    @user = user
  end

  def call
    @recipe = Recipe.new(@scrap_data.slice(:title, :difficulty, :cooking_time, :preparation_time, :number_of_servings))
    @recipe.user = @user
    @recipe.save!

    @scrap_data[:ingredients].each do |ingredient_data|
      ingredient = Ingredient.find_or_create_by(name: ingredient_data[:name])
      @recipe.recipe_ingredients.create(ingredient: ingredient, quantity_value: ingredient_data[:quantity_value], quantity_unit: ingredient_data[:quantity_unit])
    end

    @scrap_data[:steps].each do |step_data|
      @recipe.preparation_steps.create(step_data)
    end

    category = Category.find_or_create_by(name: @scrap_data[:category_name])
    @recipe.recipe_categories.create(category: category)

    @recipe.photo.attach(
      io: URI.open(@scrap_data[:image_name]),
      filename: @scrap_data[:title], # use the extension of the attached file here
      content_type: 'image/jpg' # use the mime type of the attached file here
    )

    @recipe
  end
end
