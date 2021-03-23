class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.cocktail_id = params[:cocktail_id]
    @comment.save
    redirect_to cocktail_path(@comment.cocktail)
  end

  def destroy
    @comment.destroy
    redirect_to cocktail_path(@comment.cocktail)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :cocktail_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
