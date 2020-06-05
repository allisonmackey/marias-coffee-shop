require 'rails_helper'

describe '#Users' do
  it 'allows user to sign up' do
    click_link 'SIGN UP'
    fill_in "user[email]", :with => 'test@test.com'
    fill_in "user[password]", :with => 'test123'
    fill_in "user[password_confirmation]",  :with => 'test123'
    click_on 'Sign up'
    expect(page).to have_content 'test@test.com'
  end
end