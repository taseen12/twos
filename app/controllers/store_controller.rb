class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    session[:visit_count] ||= 0
    session[:visit_count] += 1
    @visit_count = session[:visit_count]

  end
end
