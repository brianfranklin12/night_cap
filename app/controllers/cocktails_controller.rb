class CocktailsController < ApplicationController
  before_action :require_user_logged_in!
  
  def index
    @cocktails = current_user.cocktails
  end
end