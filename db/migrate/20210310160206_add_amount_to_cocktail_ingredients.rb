class AddAmountToCocktailIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktail_ingredients, :amount, :string
  end
end
