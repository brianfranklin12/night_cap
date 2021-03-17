class Cocktail < ApplicationRecord

  belongs_to :user
  has_many :cocktail_ingredients, dependent: :destroy
  has_many :ingredients, through: :cocktail_ingredients
  
  accepts_nested_attributes_for :cocktail_ingredients, allow_destroy: true

  validates_presence_of :name, :style, :description

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient if ingredient.persisted?
    end
  end

end
