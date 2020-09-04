class ProductsController < ApplicationController

  def index
    @products = Product.all
    @products = @products.where('title LIKE ?', "%#{params[:search]}%")
  end

end
