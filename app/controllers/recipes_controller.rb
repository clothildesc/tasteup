# require_relative '../models/recipe' # Add this line

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy favorite]

  def my_recipes
      @favorite_recipes = current_user.favorited_by_type('Recipe')
      @my_recipes = current_user.recipes
      @user = current_user
      favorited_users = current_user.favorited_by_type('User')
      @favorited_users_recipes = Recipe.where(user_id: favorited_users.pluck(:id))

    if params[:query].present?
      sql_subquery = <<~SQL
        recipes.title ILIKE :query
        OR ingredients.name ILIKE :query
        OR categories.name ILIKE :query
      SQL

      @favorite_recipes = @favorite_recipes.select("distinct recipes.*").joins(:ingredients, :categories).where(sql_subquery, query: "%#{params[:query]}%")
      @my_recipes = @my_recipes.select("distinct recipes.*").joins(:ingredients, :categories).where(sql_subquery, query: "%#{params[:query]}%")
      @favorited_users_recipes = @favorited_users_recipes.select("distinct recipes.*").joins(:ingredients, :categories).where(sql_subquery, query: "%#{params[:query]}%")
      @favorited_users_recipes = @favorited_users_recipes.where.not(id: @favorite_recipes.map(&:id))

    end
  end

  def index
    @recipes = Recipe.all
  end

  def inspiration
    @popular_recipes = Recipe.joins(:favorited).group(:id).order('count(favorites.id) DESC').limit(5)
    @preview_recipes = Recipe.all.sample(10)
  end

  def favorite
    if current_user.favorited?(@recipe)
      current_user.unfavorite(@recipe)
      redirect_to recipe_path(@recipe), notice: "Recette retirée des favoris."
    else
      current_user.favorite(@recipe)
      redirect_to recipe_path(@recipe), notice: "Recette ajoutée aux favoris."
    end
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
    @user = @recipe.user
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
