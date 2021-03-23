class LikesController < ApplicationController
  before_action :find_cocktail
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like a cocktail more than once"
    else
      @cocktail.likes.create(user_id: current_user.id)
    end
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    if !already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_like
    @like = @cocktail.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, cocktail_id: params[:cocktail_id]).exists?
  end

end