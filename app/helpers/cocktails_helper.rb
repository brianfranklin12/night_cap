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

  # def choose_image
  #   if cocktail.style == 0
  #     "<%= image_tag '/logo.svg', class: "w-full mx-auto", alt: "rocks glass" %>"
  #   elsif cocktail.style == 1
  #     "<%= image_tag '/logo.svg', class: "w-full mx-auto", alt: "rocks glass" %>"
  #   else
  #     "<%= image_tag '/logo.svg', class: "w-full mx-auto", alt: "rocks glass" %>"
  #   end
  # end
end
