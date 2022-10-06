class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user: current_user).order(created_at: :desc)
  end

  def show
    @recipe, = Recipe.where(id: params[:id], user: current_user)
    p @recipe.preparation_time
  end

  def destroy
    @recipe, = Recipe.where(id: params[:id], user: current_user)
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe deleted!'
  end

  def public
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
