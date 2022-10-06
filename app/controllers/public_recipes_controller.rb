class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe, = Recipe.where(id: params[:id], public: true)
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end
end
