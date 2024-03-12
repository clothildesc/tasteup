class UsersController < ApplicationController
  before_action :set_user, only: [:follow]

  def recipes
    @user = User.find(params[:id])
    @recipes = @user.recipes
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
