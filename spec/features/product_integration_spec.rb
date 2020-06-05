require 'rails_helper'

describe '#Products' do
  before(:each)do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin=> true )
    login_as(user, :scope => :user)
  end

  it 'adds a new product' do
 
    visit new_product_path
    fill_in "product[name]", :with => '123Test'
    fill_in "product[cost]", :with => '100'
    fill_in "product[country_of_origin]",  :with => 'TEST COUNTRY'
    click_on 'Submit!'
    expect(page).to have_content'123 Test'
  end

  it 'deletes a product' do   
    test_product = Product.create(name:"123 Test", cost: 6, country_of_origin: 'Test Country', id: nil)
    visit product_path(test_product.id) 
    click_link 'DELETE PRODUCT'
    expect(page).to have_no_content '123 Test'
  end

  it 'edits a product' do   
    test_product = Product.create(name:"123 Test", cost: 6, country_of_origin: 'Test Country', id: nil)
    visit product_path(test_product.id) 
    click_link 'EDIT PRODUCT'
    fill_in "product[name]", :with => '456 Test Update'
    fill_in "product[cost]", :with => '100'
    fill_in "product[country_of_origin]",  :with => 'Test Country'
    click_on 'Submit!'
    expect(page).to have_content '456 Test Update'
  end



end