class RecipesController < ApplicationController
  def index
    @recipes = Recipe
      .includes(:user)
      .where(user: current_user)
      .order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(create_params)

    if @recipe.save
      redirect_to(recipes_path, notice: 'Recipe created successfully!')
    else
      render(:new, status: :unprocessable_entity, alert: @recipe.errors)
    end
  end

  def show
    @recipe, = Recipe.where(id: params[:id], user: current_user)
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def destroy
    @recipe, = Recipe.where(id: params[:id], user: current_user)
    @recipe&.destroy
    redirect_to recipes_path, notice: 'Recipe deleted!'
  end

  private

  def create_params
    params
      .require(:recipe)
      .permit(:name, :preparation_time, :cooking_time, :description)
      .merge(user: current_user)
  end
end
