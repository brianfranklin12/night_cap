class IngredientsController < ApplicationController
  def index
    @ingredients = current_user.ingredients
  end
end