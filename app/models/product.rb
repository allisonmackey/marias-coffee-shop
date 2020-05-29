class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :cost, :country_of_origin, presence: true
  validates :cost, numericality: true
end
