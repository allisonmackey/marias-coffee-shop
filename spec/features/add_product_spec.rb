require 'rails_helper'

describe 'add a product to page'do
  it 'adds a new product' do
    visit products_path
    click_link 'ADD PRODUCT'
    fill_in "product[name]", :with => 'TEST PRODUCT'
    fill_in "product[cost]", :with => '100'
    fill_in "product[country_of_origin]",  :with => 'TEST COUNTRY'
    click_on 'Submit!'
    expect(page).to have_content 'Test Product'
  end

  
end