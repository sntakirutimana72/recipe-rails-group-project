module RecipeHelper
  def recipe_cost(recipe)
    Food
      .joins(:recipe_foods)
      .where("recipe_foods.food_id = #{recipe.id}")
      .sum(:price)
  end
end
