class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true

  has_many :ratings

  validates :title, presence: true
  validates :text, presence: true
  validates :rating, presence: true
  validates :category_id, presence: true

  scope :by_category, ->(category) { where(category: category) }
  scope :by_rating, ->(rating) { where(rating: rating) }
end
