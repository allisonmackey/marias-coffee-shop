class CustomController < ApplicationController 
  def landing_page
    @products = Products.all 
    render :landing_page
  end