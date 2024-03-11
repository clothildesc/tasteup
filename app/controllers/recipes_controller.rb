# require_relative '../models/recipe' # Add this line

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def my_recipes
    @favorite_recipes = current_user.favorite_recipes
    # @following_recipes = Recipe.where(user: current_user.follows).order(created_at: :desc)
    @my_recipes = current_user.recipes
    @recipes_user2 = Recipe.joins(:user).where(users: { email: "alice@gmail.com" })
    @recipes_user2 = @recipes_user2.where.not(id: @favorite_recipes.map(&:id))
    # @recipes_user2 à remplacer par les nouvelles recettes qu'on de nos follows

    if params[:query].present?
      sql_subquery = <<~SQL
        recipes.title ILIKE :query
        OR ingredients.name ILIKE :query
        OR categories.name ILIKE :query
      SQL

      @favorite_recipes = @favorite_recipes.select("distinct recipes.*").joins(:ingredients, :categories).where(sql_subquery, query: "%#{params[:query]}%")
      @my_recipes       = @my_recipes.select("distinct recipes.*").joins(:ingredients, :categories).where(sql_subquery, query: "%#{params[:query]}%")
      @recipes_user2    = @recipes_user2.select("distinct recipes.*").joins(:ingredients, :categories).where(sql_subquery, query: "%#{params[:query]}%")
      @recipes_user2 = @recipes_user2.where.not(id: @favorite_recipes.map(&:id))
      # @recipes_user2 à remplacer par les nouvelles recettes qu'on de nos follows

    end
  end

  def index
    @recipes = Recipe.all
  end

  def scrap
    url = params[:scrap][:url]
    recipe_data = ScrapMarmiton.new(url).call
    @recipe = CreateRecipeFromScrapData.new(recipe_data, user: current_user).call


    @ingredients = Ingredient.all
    @categories = Category.all
    @preparation_step = PreparationStep.new
    render :new
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
    @step = params[:step]
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
