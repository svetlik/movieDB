class Category < ApplicationRecord
  has_many :movies

  validates :name, presence: true
  validates_uniqueness_of :name, message: ' already exists'
end
