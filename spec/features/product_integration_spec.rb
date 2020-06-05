require 'rails_helper'

describe '#Products' do


  it 'adds a new product' do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin=> true )
    login_as(user, :scope => :user)
    visit new_product_path
    fill_in "product[name]", :with => '123Test'
    fill_in "product[cost]", :with => '100'
    fill_in "product[country_of_origin]",  :with => 'TEST COUNTRY'
    click_on 'Submit!'
    expect(page).to have_content'123 Test'
  end

#   it 'deletes a product' do   
#     test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
#     visit product_path(test_product.id) 
#     click_link 'DELETE PRODUCT'
#     expect(page).to have_no_content 'Test'
#   end

#   it 'edits a product' do   
#     test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
#     visit product_path(test_product.id) 
#     click_link 'EDIT PRODUCT'
#     fill_in "product[name]", :with => 'Test Update'
#     fill_in "product[cost]", :with => '100'
#     fill_in "product[country_of_origin]",  :with => 'Test Country'
#     click_on 'Submit!'
#     expect(page).to have_content 'Test Update'
#   end
# end

# describe '#Reviews' do
#   it 'adds a new review' do
#     test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
#     visit product_path(test_product.id) 
#     click_link 'ADD REVIEW'
#     fill_in "review[author]", :with => 'Test Author'
#     fill_in "review[content_body]", :with => 'testing review body need at leat 50 characters: testing, testing.'
#     fill_in "review[rating]",  :with => 5
#     click_on 'Submit!'
#     expect(page).to have_content 'Test Author'
#   end

#   it 'deletes a review' do   
#     test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
#     test_review = Review.create(author:"Test Author", content_body: 'testing review body need at leat 50 characters: testing, testing.', rating: 4, product_id: test_product.id, id: nil)
#     visit edit_product_review_path(test_product, test_review)
#     click_link "DELETE THIS REVIEW"
#     # click_on "ok"
#     expect(page).to have_no_content(test_review)
#   end
end