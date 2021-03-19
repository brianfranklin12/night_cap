class IngredientsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :find_user_ingredients

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
    
end