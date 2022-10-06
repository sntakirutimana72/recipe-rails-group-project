class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe, = Recipe.where(id: params[:id], public: true)
  end
end
