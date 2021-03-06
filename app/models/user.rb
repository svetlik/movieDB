class User < ApplicationRecord
  has_secure_password
  has_many :movies
  has_many :ratings

  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 42 }
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
end
