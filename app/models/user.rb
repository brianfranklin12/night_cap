class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :username

  has_many :cocktails, dependent: :destroy
end
