module CocktailsHelper
  def format_title
    if params[:user_id]
      "#{User.find(params[:user_id]).username}'s Cocktails"
    elsif params[:ingredient_id]
      "Cocktails with #{Ingredient.find(params[:ingredient_id]).name}"
    else
      "Cocktails Index"
    end
  end
end
