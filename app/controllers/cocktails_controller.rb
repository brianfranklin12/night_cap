class CocktailsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  before_action :can_edit?, only: [:edit, :update, :destroy]

  def index
    if params[:user_id]
      @cocktails = User.find(params[:user_id]).cocktails
    elsif params[:ingredient_id]
      @cocktails = Ingredient.find(params[:ingredient_id]).cocktails
    else
      @cocktails = Cocktail.all 
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = current_user.cocktails.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path, notice: "Cocktail was added to your collection"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail), notice: "Cocktail was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path, notice: "Cocktail was removed from your collection"
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :style, :description, cocktail_ingredients_attributes: [:amount, :_destroy, :id, ingredient_attributes: [:name, :id]])
  end

  def set_cocktail 
    if Cocktail.find_by_id(params[:id])
      @cocktail = Cocktail.find_by_id(params[:id])
      @comments = @cocktail.comments
    else
      redirect_to cocktails_path, notice: "Cocktail couldn't be found"
    end
  end

  def can_edit?
    if !(@cocktail.user == current_user)
      redirect_to cocktails_path, notice: "You cannot edit a cocktail you didn't create"
    end
  end

end