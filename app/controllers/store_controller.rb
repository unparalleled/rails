class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
    @cart= current_cart

    session[:counter] = 
    if session[:counter].nil? then 0
      else session[:counter] + 1
    end
  
  end
end
