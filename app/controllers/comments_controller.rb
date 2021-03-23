class CommentsController < ApplicationController
  before_action :find_cocktail

  def create
    @cocktail.comments.create(user_id: current_user.id)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @comment.destroy
    redirect_to cocktail_path(@cocktail_path)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_comment
    @comment = @cocktail.comments.find(params[:id])
  end
end
