class ProductsController < ApplicationController

  before_action :parents

  def index
    @products = Product.all
    @products = @products.where('title LIKE ?', "%#{params[:search]}%")
  end


  def parents
    @category_parent = Category.where(ancestry: nil)  # データベースから、親カテゴリーのみ抽出し、配列化
  end

  def childs
    @category_children = Category.where(ancestry: "#{params[:id]}")
  end

end