module CocktailsHelper
  def format_title
    if params[:user_id]
      "#{User.find(params[:user_id]).username}'s Cocktails"
    elsif params[:search]
      "Cocktails with #{Ingredient.find_by_search(params[:search]).name}"
    else
      "Cocktails Index"
    end
  end
end
