class Ingredient < ApplicationRecord
  has_many :cocktail_ingredients, dependent: :destroy
  has_many :cocktails, through: :cocktail_ingredients

  validates_presence_of :name

  def self.find_by_search(search)
    @ingredient = Ingredient.where('name LIKE ?', "%#{search}%").first
  end

end
