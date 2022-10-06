class ShoppingListsController < ApplicationController
  def missing_items
    og = Food.where(user: current_user)
    mr_ids = RecipeFood.where.not('food_id not in (?)', Array.wrap(og.ids)).ids
    found_ids = Set.new(og.ids) - Set.new(mr_ids)

    @counter = og.length
    @price = og.sum(:price)
    @foods = Food.where(id: found_ids)

    render(:index)
  end
end
