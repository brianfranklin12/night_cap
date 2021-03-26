class Cocktail < ApplicationRecord
  scope :filtered, -> (search) { Cocktail.includes(:ingredients).where('ingredients.name LIKE ?', "%#{search}%").references(:ingredients)}

  belongs_to :user
  has_many :cocktail_ingredients, dependent: :destroy
  has_many :ingredients, through: :cocktail_ingredients
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  accepts_nested_attributes_for :cocktail_ingredients, allow_destroy: true

  validates_presence_of :name, :style, :description

  before_save :find_or_create_ingredients

  def find_or_create_ingredients
    self.cocktail_ingredients.each do |cocktail_ingredient|
      cocktail_ingredient.ingredient = Ingredient.find_or_create_by(name: cocktail_ingredient.ingredient.name)
    end
  end

end

