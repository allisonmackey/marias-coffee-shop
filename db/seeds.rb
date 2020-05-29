# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

50.times do 
  product = Product.create!(
    name: Faker::Coffee.blend_name, 
    country_of_origin: Faker::Coffee.origin, 
    cost: Faker::Number.within(range: 15..35)
  )

  if product.persisted?
    rand(15..50).times do
      product.reviews.create!(
        author: Faker::Name.name, 
        content_body: Faker::Lorem.paragraph_by_chars(number: 65, supplemental: false), 
        rating: rand(1..5)
      )
    
    end
  end
  p "Created #{Product.count} products & #{Review.count} reviews"
end