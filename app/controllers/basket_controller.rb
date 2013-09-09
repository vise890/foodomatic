class BasketController < ApplicationController

  def show
    @basket = current_user.basket.list
  end

  def count_items
    item_count = current_user.basket.list.size
    render json: { item_count: item_count }.to_json
  end

  def add_to_basket
    recipe = Recipe.find(params[:recipe])
    current_user.basket.add(recipe)
    redirect_to basket_count_items_path
  end

end
