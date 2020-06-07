class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save(:titleize_product)
  validates :name, :cost, :country_of_origin, presence: true
  validates :cost, numericality: true
 
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(5)
    )}

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  private
    def titleize_product
      no_caps = ["a", "is", "you", "he", "she", "it", "we", "you", "me", "him", "her", "us", "my",  "his", "its", "our", "who",  "if", "how", "as"]
      result = []
      split_name = self.name.split(" ")
      split_name.each do |w|
        if no_caps.any? {|c| w == c }
          w = w
          result.push(w)
        else
        w = w.titleize
        result.push(w)
        end
      end  
      self.name = result.join(" ")
    end
end
