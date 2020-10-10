class ProductsController < ApplicationController
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
  before_action :set_product, only: [:show, :edit]
  before_action :category_parent_array, only: [:new, :edit]

  def index
    @products = Product.where(buyer_id: nil).includes(:product_images)
    if @products.present?
      @product = Product.where( 'id >= ?', rand(Product.first.id..Product.last.id) ).first
      @category = Product.where(category_id: "#{@product [:category_id]}", buyer_id: nil)
    end
  end

  def new
    @product = Product.new
    @product.product_images.new
    @products = Product.includes(:product_images).order('created_at DESC')
  end

  def get_children_category
    @category_children = Category.find_by(name: "#{params[:parent_name]}").children
  end

  # DBから親カテゴリーのみ抽出。==> _header.html.hamlへ
  # def parents
  #   @category_parent = Category.where(ancestry: nil)
  # end

  # def childs
  #   @category_children = Category.where(ancestry: "#{params[:id]}")
  # end

  def create
    @product = Product.new(product_params)
    unless @product.save
      flash[:error] = "必須項目を全て入力してください"
      redirect_to action: "new"
    end
  end

  def show
    @category = Category.find(@product.category.ancestry)
    @products = Category.where(ancestry: @category.id).map { |c| c.products }.flatten!.shuffle
  end

  def edit
    @category_child_array = @product.category.parent.children
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "商品情報を編集しました"
      redirect_to product_path(@product.id)
    else
      flash[:error] = '必須項目を全て入力してください'
      redirect_to action: "edit"
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      product_path(product.id)
    else
      flash[:error] = "商品を削除できません"
      redirect_to action: "show"
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :text, :condition_id, :brand, :shipping_charge_id, :deliver_leadtime_id, :price, :seller_id, :buyer_id, :category_id, :prefecture_id,
                                    product_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def need_login
    redirect_to root_path unless user_signed_in?
  end

  def ensure_correct_user
    @product = Product.find(params[:id])
    if current_user.id != @product.seller_id
    flash[:notice] = "権限がありません"
    redirect_to product_path(@product.id)
    end
  end

  def category_parent_array
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

end
