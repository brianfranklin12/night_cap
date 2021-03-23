class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
     flash[:notice] = "Comment saved."
    else
      flash[:notice] = "Something went wrong"
    end
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
