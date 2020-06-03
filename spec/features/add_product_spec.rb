require 'rails_helper'

describe '#Products' do
  it 'adds a new product' do
    visit products_path
    click_link 'ADD PRODUCT'
    fill_in "product[name]", :with => 'TEST PRODUCT'
    fill_in "product[cost]", :with => '100'
    fill_in "product[country_of_origin]",  :with => 'TEST COUNTRY'
    click_on 'Submit!'
    expect(page).to have_content 'Test Product'
  end

  it 'deletes a product' do   
    test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
    visit product_path(test_product.id) 
    click_link 'DELETE PRODUCT'
    expect(page).to have_no_content 'Test'
  end

  it 'edits a product' do   
    test_product = Product.create(name:"Test", cost: 6, country_of_origin: 'Test Country', id: nil)
    visit product_path(test_product.id) 
    click_link 'EDIT PRODUCT'
    fill_in "product[name]", :with => 'Test Update'
    fill_in "product[cost]", :with => '100'
    fill_in "product[country_of_origin]",  :with => 'Test Country'
    click_on 'Submit!'
    expect(page).to have_content 'Test Update'
  end



end