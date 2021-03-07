class CocktailsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  
  def index
    @cocktails = current_user.cocktails
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
      redirect_to cocktails_path, notice: "Cocktail was updated successfully"
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
    params.require(:cocktail).permit(:name, :style)
  end

  def set_cocktail 
    @cocktail = current_user.cocktails.find(params[:id])
  end


end