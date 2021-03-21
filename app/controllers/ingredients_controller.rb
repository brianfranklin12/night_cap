class IngredientsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :find_user_ingredients
  before_action :set_ingredient, only: :show

  def index
  end

  private 

    def find_user_ingredients
      @ingredients = []
      current_user.cocktails.each do |cocktail|
        cocktail.ingredients.each do |ingredient|
          @ingredients << ingredient if !@ingredients.include? ingredient 
        end
      end
      @ingredients
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id]) if @ingredients.include? Ingredient.find(params[:id])
    end
    
end