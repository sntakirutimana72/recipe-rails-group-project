# frozen_string_literal: true

Rails.application.routes.draw do
  root 'public_recipes#index'

  get 'general_shopping_list', to: 'shopping_lists#missing_items'

  devise_for :users

  resources :recipes, only: [:index, :show, :destroy, :new, :create] do
    resources :recipe_foods, only: [:index, :edit, :destroy]
  end

  resources :foods, only: [:new, :create, :destroy, :edit, :index]

  namespace :public_recipes do
    get '', action: 'index'
    get '/:id', action: 'show'
  end
end
