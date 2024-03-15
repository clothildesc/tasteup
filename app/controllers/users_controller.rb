class UsersController < ApplicationController
  before_action :set_user, only: [:follow]

  def recipes
    @user = User.find(params[:id])
    @recipes = @user.recipes.order(created_at: :asc)
    if params[:query].present?
      cleaned_query = params[:query].strip
      sql_subquery = <<~SQL
        recipes.title ILIKE :query
        OR ingredients.name ILIKE :query
        OR categories.name ILIKE :query
      SQL
      @recipes = @recipes.select("distinct recipes.*").joins(:ingredients, :categories).where(sql_subquery, query: "%#{cleaned_query}%")
    end
  end

  def follow
    if current_user.favorited?(@user)
      current_user.unfavorite(@user)
      redirect_to recipes_user_path(@user), notice: "Abonnement annulé."
      flash[:notice] = "Abonnement annulé."
    else
      current_user.favorite(@user)
      redirect_to recipes_user_path(@user), notice: "Vous êtes maintenant abonné(e)."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
