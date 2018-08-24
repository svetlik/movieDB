class Category < ApplicationRecord
  has_many :movies

  validates_uniqueness_of :name, message: 'Category already exists'
end
