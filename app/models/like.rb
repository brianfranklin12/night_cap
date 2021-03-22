class Like < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
end
