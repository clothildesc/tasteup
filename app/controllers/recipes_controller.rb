class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def my_recipes
    @favorite_recipes = current_user.favorite_recipes
    # @following_recipes = Recipe.where(user: current_user.follows).order(created_at: :desc)
    @my_recipes = current_user.recipes
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.includes(:ingredient)
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @categories = Category.all
    @preparation_step = PreparationStep.new
  end

  def create
    if params[:recipe_url].present?
      @recipe_data = ScrapWithOpenai.new(params[:recipe_url]).call
      @recipe = CreateRecipeFromScrappingData.new(@recipe_data).call
    else
    end
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Votre recette a été ajoutée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "Votre recette a été modifiée."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to my_recipes_path, notice: "Votre recette a été supprimée."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :difficulty, :cooking_time,
      :preparation_time, :number_of_servings, :note, category_ids: [],
      :preparation_steps_attributes => [:id, :instruction, :_destroy],
      :recipe_ingredients_attributes => [:id, :quantity_unit, :quantity_value, :ingredient_id, :_destroy])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
