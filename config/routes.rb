# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :recipes, only: [:index, :show] do
    resources :recipe_foods, only: [:index, :edit, :destroy]
  end

  resources :foods, only: [:new, :create, :destroy, :edit]

  get 'public_recipes', to: 'recipes#public'
  get 'general_shopping_list', to: 'shopping_lists#missing_items'
end
