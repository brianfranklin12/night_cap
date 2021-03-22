class LikesController < ApplicationController
  before_action : find_cocktail

  def create 
    @cocktail.likes.create(user_id: current_user.id)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  
end