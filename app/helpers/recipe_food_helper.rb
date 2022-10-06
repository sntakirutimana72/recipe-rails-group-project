module RecipeFoodHelper
  def query_recipe
    @recipe, = Recipe.where(id: params[:recipe_id], user: current_user)
  end

  def query_ingredient
    @recipe_food, = RecipeFood.where(params.permit(:id, :recipe_id))
  end
end
