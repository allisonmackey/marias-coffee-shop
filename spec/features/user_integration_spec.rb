require 'rails_helper'

describe '#Users' do
  it 'allows user to sign up' do
    visit new_user_registration_path
    fill_in "user[email]", :with => 'test@test.com'
    fill_in "user[password]", :with => 'test123'
    fill_in "user[password_confirmation]",  :with => 'test123'
    click_on 'Sign up'
    expect(page).to have_content 'test@test.com'
  end

  it 'does not allow a non-user to see edit/delete/review feilds' do
    test_product = Product.create(name:"123 Test", cost: 6, country_of_origin: 'Test Country', id: nil)
    visit product_path(test_product.id) 
    expect(page).to have_no_content 'EDIT'
    expect(page).to have_no_content 'DELETE'
    expect(page).to have_no_content 'ADD'
  end
end