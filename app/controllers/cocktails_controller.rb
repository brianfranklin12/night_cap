class CocktailsController < ApplicationController
  before_action :require_user_logged_in!
  
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


end