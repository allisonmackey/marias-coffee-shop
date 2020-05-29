class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save(:titleize_product)
  validates :name, :cost, :country_of_origin, presence: true
  validates :cost, numericality: true
  
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
