class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :username

  has_many :cocktails, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy 
end
