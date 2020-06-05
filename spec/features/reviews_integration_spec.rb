require 'rails_helper'

describe '#Reviews' do
  it 'adds a new review' do
    test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
    visit product_path(test_product.id) 
    click_link 'ADD REVIEW'
    fill_in "review[author]", :with => 'Test Author'
    fill_in "review[content_body]", :with => 'testing review body need at leat 50 characters: testing, testing.'
    fill_in "review[rating]",  :with => 5
    click_on 'Submit!'
    expect(page).to have_content 'Test Author'
  end

  it 'deletes a review' do   
    test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
    test_review = Review.create(author:"Test Author", content_body: 'testing review body need at leat 50 characters: testing, testing.', rating: 4, product_id: test_product.id, id: nil)
    visit edit_product_review_path(test_product, test_review)
    click_link "DELETE THIS REVIEW"
    expect(page).to have_no_content(test_review)
  end
end