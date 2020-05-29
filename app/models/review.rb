class Review < ApplicationRecord
  belongs_to :product
  validates :author, :content_body, :rating, presence: true
  validates :rating, numericality: true
  validates_length_of :content_body, in: 50..250
  validates_numericality_of :rating, greater_than: 0
  validates_numericality_of :rating, less_than_or_equal_to: 5
end