class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true

  has_many :ratings
end
