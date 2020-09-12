class ProductsController < ApplicationController

  def index
    @products = Product.where(buyer_id: nil).includes(:product_images)
    @product = Product.where( 'id >= ?', rand(Product.first.id..Product.last.id) ).first
    @category = Product.where(category_id: "#{@product [:category_id]}", buyer_id: nil)
  end

  def new
    @product = Product.new
    @product.product_images.new
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @products = Product.includes(:product_images).order('created_at DESC')
  end


  def get_children_category
    @category_children = Category.find_by(name: "#{params[:parent_name]}").children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      flash[:error] = '必須項目を全て入力してください'
      redirect_to new_product_path
    end
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.find(@product.category.ancestry)
    @products = Category.where(ancestry: @category.id).map { |c| c.products }.flatten!.shuffle
  end

  private
  def product_params
    params.require(:product).permit(:title, :text, :condition_id, :brand, :shipping_charge_id, :deliver_leadtime_id, :price, :seller_id, :buyer_id, :category_id, :prefecture_id, product_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def need_login
    redirect_to root_path unless user_signed_in?
  end
end
