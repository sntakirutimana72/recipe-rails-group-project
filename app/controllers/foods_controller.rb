class FoodsController < ApplicationController
  def index
    @foods = Food.where(user: current_user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(create_params)

    if @food.save
      redirect_to(foods_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    food, = Food.where(id: params[:id], user: current_user)
    food&.destroy!
    redirect_to(foods_path)
  end

  private

  def create_params
    params
      .require(:food)
      .permit(:name, :price, :measurement_unit, :quantity)
      .merge(user: current_user)
  end
end
