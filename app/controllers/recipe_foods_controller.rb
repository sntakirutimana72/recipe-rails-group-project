class RecipeFoodsController < ApplicationController
  include RecipeFoodHelper

  def new
    @recipe_food = RecipeFood.new
    query_recipe
  end

  def create
    query_recipe
    @recipe_food = RecipeFood.new(create_params)
    if @recipe_food.save
      redirect_to(recipe_url(@recipe), notice: 'Ingredient has been added successfully!')
    else
      render(:new, alert: 'Something went wrong!')
    end
  end

  def edit
    query_ingredient
  end

  def update
    query_ingredient

    if @recipe_food.update(update_params)
      flash[:notice] = 'Recipe food updated Successfully!'
    else
      flash[:alert] = 'Something went wrong!'
    end

    redirect_to(recipe_url(@recipe_food.recipe))
  end

  def destroy
    query_ingredient
    @recipe_food.destroy
    redirect_to(recipe_url(params[:recipe_id]), notice: 'Ingredient deleted!')
  end

  private

  def create_params
    params.permit(:quantity, :recipe_id)
  end

  def update_params
    params.require(:ingred).permit(:quantity)
  end
end
