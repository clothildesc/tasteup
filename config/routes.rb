Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#my_recipes"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :recipes do
    resources :favorites, only: :create
    member do
      post :duplicate
    end
  end
  get :my_recipes, to: "recipes#my_recipes"
  resources :favorites, only: :destroy

  resources :users, only: [] do
    resources :follows, only: :create
  end
end
