class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:show]

  def create
    recipe = Recipe.find_by_id(ingredient_params[:recipe_id])
    ingredient = recipe.ingredients.build(ingredient_params)
    if ingredient.save
      redirect ingredient_path ingredient
    end
  end

  def show
    render partial: 'ingredient', locals: { ingredient: @ingredient }
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:recipe_id, :product_id, :required_amount)
  end

end
