class Review < ApplicationRecord
  belongs_to :product
  def blank_stars 
    5 - rating.to_i
  end
end