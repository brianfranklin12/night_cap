class Comment < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user

  validates_presence_of :body 
  
end
