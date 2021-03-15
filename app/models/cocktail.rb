class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :cocktail_ingredients, dependent: :destroy
  has_many :ingredients, through: :cocktail_ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      binding.irb
      self.ingredients << ingredient
    end
  end
end
