class IngredientsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_ingredient, only: :show

  def index
    @ingredients = Ingredient.all
  end

  private 

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
    
end